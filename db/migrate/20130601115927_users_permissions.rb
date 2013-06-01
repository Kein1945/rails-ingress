class UsersPermissions < ActiveRecord::Migration
  def change
  	create_table 'users_permissions', :id => false do |t|
		t.column :user_id, :integer
		t.column :permission_id, :integer
  	end
  end
end
