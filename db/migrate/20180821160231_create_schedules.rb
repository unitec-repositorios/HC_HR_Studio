class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :fecha
      t.time :hora_entrada
      t.time :hora_salida

      t.timestamps
    end
  end
end
