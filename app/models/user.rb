class User < ActiveRecord::Base
   has_many :posts
   
   before_save do
     self.email = email.downcase
     self.name = name.split.map{|s| s.capitalize}.join(" ")
   end

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   validates :password, presence: true, length: { minimum: 6 }
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password
end
