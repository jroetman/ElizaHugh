class AddLongDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :long_description, :string
  end
end
