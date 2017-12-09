class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :school
      t.string :cellphone
      t.string :email
      t.string :profession

      t.timestamps
    end
  end
end
