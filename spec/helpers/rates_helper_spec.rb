require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatesHelper. For example:
#
# describe RatesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# how to write this?
RSpec.describe RatesHelper, type: :helper do
  describe "rate_to_button" do
       it "turns rate into HTML buttons" do
         r1 = Rate.create!(severity: :PG)
         expected_html = '<a class="btn-xs btn-primary" href="/rates/1">r1</a>'
         expect(rate_to_buttons(r1).to eq expected_html
       end
     end
end
