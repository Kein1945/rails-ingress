class ActionsRenameField < ActiveRecord::Migration
  def up
  	rename_column :actions, :deploed, :deployed
  end

  def down
  	rename_column :actions, :deployed, :deploed
  end
end
