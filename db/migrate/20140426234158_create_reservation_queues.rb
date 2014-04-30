class CreateReservationQueues < ActiveRecord::Migration
  def change
    create_table :reservation_queues do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
