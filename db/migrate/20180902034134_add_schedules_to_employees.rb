class AddSchedulesToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :schedule, foreign_key: :employee_id_number
  end
end
