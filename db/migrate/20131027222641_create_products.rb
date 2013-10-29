class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column "title", :string
      t.column "category", :string
      t.column "image_path", :string 
      t.timestamps
    end
  end
end
