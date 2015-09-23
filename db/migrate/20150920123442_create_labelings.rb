class CreateLabelings < ActiveRecord::Migration
   def change
     create_table :labelings do |t|
       t.references :label, index: true
       t.references :topic, index: true
       t.references :post, index: true
       
       t.references :labelable, polymorphic: true, index: true

       t.timestamps null: false
     end

   end

end
