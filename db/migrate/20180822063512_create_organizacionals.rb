class CreateOrganizacionals < ActiveRecord::Migration[5.0]
  def change
    create_table :organizacionals do |t|

      t.timestamps
    end
  end
end
