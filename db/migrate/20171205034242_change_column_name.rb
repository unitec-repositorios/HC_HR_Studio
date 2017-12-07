class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :configurations, :mision, :mission
  end
end
