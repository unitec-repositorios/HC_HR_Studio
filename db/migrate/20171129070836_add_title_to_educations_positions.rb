class AddTitleToEducationsPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :educations_positions, :title, :string
  end
end
