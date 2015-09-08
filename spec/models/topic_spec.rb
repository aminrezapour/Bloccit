require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: "New Topic", description: "Posts related to this topic") }

   describe "attributes" do
     it "should respond to name" do
       expect(topic).to respond_to(:name)
     end

     it "should respond to description" do
       expect(topic).to respond_to(:description)
     end

     it "should respond to public" do
       expect(topic).to respond_to(:public)
     end

     it "should be public by default" do
       expect(topic.public).to be(true)
     end
   end

   it { should have_many(:posts) }

end
