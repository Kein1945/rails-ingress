class ActionsRenameDestroyDeploy < ActiveRecord::Migration
  def up
  	rename_column :actions, :deploy, :deploy_ap
  	rename_column :actions, :destroy, :destroy_ap
  end

  def down
  	rename_column :actions, :deploy_ap, :deploy
  	rename_column :actions, :destroy_ap, :destroy
  end
end
