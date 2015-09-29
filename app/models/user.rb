class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

   before_save do
     self.email = email.downcase
    #  puts "*" * 20
    #  puts self.inspect
     self.name = name.split.map{|s| s.capitalize}.join(" ")
    #  puts "*" * 20
    #  puts self.inspect
   end

   before_save { self.role ||= :member }

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   validates :password, presence: true, length: { minimum: 6 }
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password
   enum role: [:member,:admin,:moderator]

   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end

   def self.avatar_url(user, size)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end

end
