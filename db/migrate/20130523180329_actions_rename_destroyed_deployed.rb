class ActionsRenameDestroyedDeployed < ActiveRecord::Migration
  def up
  	rename_column :actions, :deployed, :deployes
  	rename_column :actions, :destroyed, :destroyes
  end

  def down
  	rename_column :actions, :deployes, :deployed
  	rename_column :actions, :destroyes, :destroyed
  end
end
