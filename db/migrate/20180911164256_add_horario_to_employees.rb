class AddHorarioToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :horario, :string
  end
end
