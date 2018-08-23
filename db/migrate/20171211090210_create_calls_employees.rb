class CreateCallsEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :calls_employees do |t|

      t.timestamps
    end
  end
end
