class CreateCallsInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :calls_instructors do |t|

      t.timestamps
    end
  end
end
