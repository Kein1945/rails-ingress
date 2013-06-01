class PermissionsInUsersManyToMany < ActiveRecord::Migration
  def up
  	create_table :users_permissions, :id => false do |t|
      t.integer :permission_id
      t.integer :user_id
    end

    add_index :users_permissions, [:permission_id, :user_id]
  end

  def down
  	drop_table :users_permissions
  end
end
