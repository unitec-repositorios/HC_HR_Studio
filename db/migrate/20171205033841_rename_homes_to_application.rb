class RenameHomesToApplication < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :homes, :configurations
  end

  def self.down
    rename_table :configurations, :homes
  end
end
