class CreateEducationsPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :educations_positions do |t|
      t.integer :education_id
      t.integer :position_id

      t.timestamps
    end
  end
end
