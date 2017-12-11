class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|
      t.string :topic
      t.string :category
      t.string :place
      t.date :date
      t.string :aquired_ability
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
