class AddColumnsToCallsInstructor < ActiveRecord::Migration[5.0]
  def change
  	add_column :calls_instructors, :instructor_id, :integer
  	add_column :calls_instructors, :call_id, :integer
  end
end
