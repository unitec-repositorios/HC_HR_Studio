class CreateAdminOrganizacionals < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_organizacionals do |t|

      t.timestamps
    end
  end
end
