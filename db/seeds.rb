# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData
# Create topics
15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
end
topics = Topic.all

# Create Posts
50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
end
posts = Post.all

# Create comments
100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

# Create advertisement
 5.times do
   Advertisement.create!(
     title: RandomData.random_sentence,
     copy: RandomData.random_paragraph,
     price: 10
   )
end
advertisements = Advertisement.all

# Creat questions
5.times do
   Question.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     resolved: false
   )
end
questions = Question.all

Post.find_or_create_by(title: "Emporio Armani", body: "A designer from Italy.")
Comment.find_or_create_by(post: posts.sample, body: "Does he know how to fix a button?")

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
