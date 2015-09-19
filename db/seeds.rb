include RandomData

# Create topics
15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
end
topics = Topic.all

# Create Users
5.times do
   user = User.create!(
     name:     RandomData.random_name,
     email:    RandomData.random_email,
     password: RandomData.random_sentence
   )
end
users = User.all

# Create Posts
50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic: topics.sample,
     user: users.sample
   )
end
posts = Post.all

# Create comments
100.times do
   Comment.create!(
     user: users.sample,
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

# Creat sponsored posts
5.times do
   SponsoredPost.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     price: 19,
     topic:  topics.sample
   )
end
sponsored_posts = SponsoredPost.all

Post.find_or_create_by(title: "Emporio Armani", body: "A designer from Italy.")
Comment.find_or_create_by(post: posts.sample, body: "Does he know how to fix a button?")

# Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
)
# Create an admin user
admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
)

# Create a moderator user
moderator = User.create!(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored posts created"
