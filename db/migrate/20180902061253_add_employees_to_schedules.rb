class AddEmployeesToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :employees, foreign_key: :employee_id_number
  end
end
