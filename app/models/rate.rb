class Rate < ActiveRecord::Base
  has_many :ratings
 # #6
   belongs_to :ratelable, polymorphic: true
 # #7
   has_many :topics, through: :ratings, source: :ratelable, source_type: :Topic
 # #8
   has_many :posts, through: :ratings, source: :ratelable, source_type: :Post
 end
