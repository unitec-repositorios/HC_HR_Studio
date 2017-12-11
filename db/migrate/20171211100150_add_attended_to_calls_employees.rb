class AddAttendedToCallsEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :calls_employees, :attended, :boolean
  end
end
