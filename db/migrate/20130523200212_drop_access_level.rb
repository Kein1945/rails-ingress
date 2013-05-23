class DropAccessLevel < ActiveRecord::Migration
  def change
  	remove_column :users, :access_level
  end
end
