class CreateProducts < ActiveRecord::Migration
   create_table :products do |t|
     t.string :title
     t.string :description
  end
end
