class ChangeAquiredAbilityToAbility < ActiveRecord::Migration[5.0]
  def change
  	rename_column :calls, :aquired_ability, :ability
  end
end
