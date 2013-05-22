class ActionsTimeToDatetime < ActiveRecord::Migration
  def up
  	remove_column :actions, :action_at
  	add_column :actions, :action_at, :datetime
  end

  def down
  	remove_column :actions, :action_at
  	add_column :actions, :action_at, :integer
  end
end
