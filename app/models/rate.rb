class Rate < ActiveRecord::Base
   has_many :ratings
   belongs_to :ratelable, polymorphic: true
   has_many :topics, through: :ratings, source: :ratelable, source_type: :Topic
   has_many :posts, through: :ratings, source: :ratelable, source_type: :Post

   # implemented later
   def self.update_rating(rating_string)
     
   end

   enum severity: [:PG, :PG13, :R]
 end
