class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :schedules, :employees_id, :employee_id_number
  end
end
