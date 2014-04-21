class AddShippingToPaymentInfo < ActiveRecord::Migration
  def change
    add_column :payment_info, :shipping, :decimal
  end
end
