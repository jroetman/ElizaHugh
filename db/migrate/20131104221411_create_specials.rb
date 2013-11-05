class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
       t.string :title
       t.string :description
    end
  end
end
