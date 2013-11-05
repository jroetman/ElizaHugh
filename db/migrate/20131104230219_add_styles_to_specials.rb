class AddStylesToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :color, :string
    add_column :specials, :border, :string
  end
end
