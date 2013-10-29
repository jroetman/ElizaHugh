class AddAttachmentAvatarToProducts < ActiveRecord::Migration
  def self.up
     add_attachment :products, :avatar
  end

  def self.down
    drop_attached_file :products, :avatar
  end
end
