class RemoveKey < ActiveRecord::Migration[5.0]
  def change
    remove_reference :schedules, :employees, index: true, foreign_key: true
  end
end
