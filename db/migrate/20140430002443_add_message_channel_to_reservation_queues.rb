class AddMessageChannelToReservationQueues < ActiveRecord::Migration
  def change
    add_column :reservation_queues, :message_channel, :string
  end
end
