require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "attributes" do
     let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }
     let(:answer) { Answer.create!(body: 'Answer Body', question: question) }

     it "should respond to body" do
       expect(question).to respond_to(:body)
     end
   end

end
