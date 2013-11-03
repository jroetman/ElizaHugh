class AddPriceAndCategoryToProducts < ActiveRecord::Migration
  def change
     add_column :products, :category, :string
     add_column :products, :price, :decimal
    
  end
end
