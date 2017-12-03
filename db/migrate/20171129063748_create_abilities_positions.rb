class CreateAbilitiesPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities_positions do |t|
      t.integer :ability_id
      t.integer :position_id

      t.timestamps
    end
  end
end
