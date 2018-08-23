class RemoveAbilityFromCalls < ActiveRecord::Migration[5.0]
  def change
    remove_column :calls, :ability, :string
  end
end
