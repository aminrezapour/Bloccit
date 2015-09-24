class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  has_one :rating, as: :rateable
  has_one :rate, through: :rating

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  validates :public, presence: true
end
