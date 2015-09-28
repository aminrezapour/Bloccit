class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :topic
  belongs_to :user
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :favorites, dependent: :destroy

  after_create :create_fav

  # default ordering using scope
  default_scope { order('rank DESC') }

  # order by title ascending using scope
  # scope :ordered_by_title, -> { order(title: :asc) }
  # order by time ascending using scope
  # scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
  end

  private

  def create_fav
    user.favorites.create!(post: self)
    FavoriteMailer.new_post(user, post, self).deliver_now
  end
end
