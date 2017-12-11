class AddAbilityToCalls < ActiveRecord::Migration[5.0]
  def change
    add_reference :calls, :ability, foreign_key: true
  end
end
