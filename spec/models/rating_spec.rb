require 'rails_helper'

 RSpec.describe Rating, type: :model do
 # #1
   it { should belong_to :rateable }
 end
