require 'rails_helper'

 RSpec.describe Rate, type: :model do
 # #4
   it { should belong_to :ratelable }
 end
