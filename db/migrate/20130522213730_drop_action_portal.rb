class DropActionPortal < ActiveRecord::Migration
  def up
  	remove_column :actions, :portal_id
  end

  def down
  	add_column :actions, :portal_id, :integer
  end
end
