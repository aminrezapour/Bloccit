class CreateRatings < ActiveRecord::Migration
   def change
     create_table :ratings do |t|
       t.references :rate, index: true
       t.references :topic, index: true
       t.references :post, index: true
 # #3
       t.references :ratelable, polymorphic: true, index: true

       t.timestamps null: false
     end
   end
end
