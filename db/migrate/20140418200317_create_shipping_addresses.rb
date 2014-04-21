class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :userid
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :address
      t.string :address2
      t.string :city
      t.string :zip
      t.string :country
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
