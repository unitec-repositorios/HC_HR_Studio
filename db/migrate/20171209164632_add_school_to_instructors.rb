class AddSchoolToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_reference :instructors, :school, foreign_key: true
  end
end
