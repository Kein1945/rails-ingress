class ActionsSumColumns < ActiveRecord::Migration
  def up
  	add_column :actions, :deploed, :integer
  	add_column :actions, :destroyed, :integer
  end

  def down
  	remove_column :actions, :deploed
  	remove_column :actions, :destroyed
  end
end
