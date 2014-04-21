class CreatePaymentInfo < ActiveRecord::Migration
    create_table :payment_info do |t|
      t.string :vendor 
      t.decimal :tax
    end
end
