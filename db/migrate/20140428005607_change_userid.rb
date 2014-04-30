class ChangeUserid < ActiveRecord::Migration
  def change
      change_table :users do |t|
         t.change :id, :string
      end
      change_table :reservation_queues do |t|
         t.change :user_id, :string
      end
      change_table :billing_addresses do |t|
         t.rename :userid, :user_id
         t.change :user_id, :string
      end
      change_table :shipping_addresses do |t|
         t.rename :userid, :user_id
         t.change :user_id, :string
      end
      change_table :cartitems do |t|
         t.rename :userid, :user_id
         t.change :user_id, :string
      end
  end
end
