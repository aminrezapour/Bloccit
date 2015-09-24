require 'rails_helper'
include RandomData

 RSpec.describe Rate, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:rate) { Rate.create!(severity: 1) }

   it { should belong_to :ratelable }
   it { should have_many :ratings }
   it { should have_many :topics }
   it { should have_many :posts }

   # is this correct?
   describe "rateable" do
     it "allows the same rate to be associated with a different topic and post" do
       topic.rate = rate
       post.rate  = rate

       topic_rate = topic.rate
       post_rate = post.rate

       expect(topic_rate).to eql(post_rate)
     end
   end

   # add a describe here to test update_rating
 end
