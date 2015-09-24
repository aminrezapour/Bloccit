class Rating < ActiveRecord::Base
 # #2
   belongs_to :rateable, polymorphic: true
 end
