require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:my_ad) { Advertisement.create!(title: "Ad for IKEA", copy: "Buy IKEA from store", price: 10) }

  context "attributes" do

      it "should respond to title" do
          expect(my_ad).to respond_to(:title)
      end

      it "should respond to copy" do
          expect(my_ad).to respond_to(:copy)
      end

      it "should respond to price" do
          expect(my_ad).to respond_to(:price)
      end

  end
end
