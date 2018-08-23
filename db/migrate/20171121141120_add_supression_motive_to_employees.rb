class AddSupressionMotiveToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :supression_motive, :text
    add_column :employees, :supression_date, :datetime
  end
end
