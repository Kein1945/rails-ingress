class DepersonalizePermission < ActiveRecord::Migration
  def change
  	remove_column :permissions, :user_id
  end
end
