class AddAddressToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :address, :text
  end
end
