class AddCompletedToEducationsPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :educations_positions, :completed, :boolean
  end
end
