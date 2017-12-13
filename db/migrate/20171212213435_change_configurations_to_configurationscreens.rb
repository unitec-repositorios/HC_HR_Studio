class ChangeConfigurationsToConfigurationscreens < ActiveRecord::Migration[5.0]
  def change
  	rename_table :configurations, :configurationscreens
  end
end
