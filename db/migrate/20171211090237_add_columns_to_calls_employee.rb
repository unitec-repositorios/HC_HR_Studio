class AddColumnsToCallsEmployee < ActiveRecord::Migration[5.0]
  def change
  	add_column :calls_employees, :employee_id, :integer
  	add_column :calls_employees, :call_id, :integer
  end
end
