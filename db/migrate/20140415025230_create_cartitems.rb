class CreateCartitems < ActiveRecord::Migration
  def change
    create_table :cartitems do |t|
      t.integer :userid
      t.integer :productid

      t.timestamps
    end
  end
end
