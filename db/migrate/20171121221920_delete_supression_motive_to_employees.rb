class DeleteSupressionMotiveToEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :supression_motive
    remove_column :employees, :supression_date
  end
end
