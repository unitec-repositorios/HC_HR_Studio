class AddCellphoneToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :cellphone, :string
  end
end
