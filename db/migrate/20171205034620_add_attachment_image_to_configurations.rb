class AddAttachmentImageToConfigurations < ActiveRecord::Migration
  def self.up
    change_table :configurations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :configurations, :image
  end
end
