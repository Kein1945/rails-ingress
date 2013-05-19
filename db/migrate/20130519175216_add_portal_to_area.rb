class AddPortalToArea < ActiveRecord::Migration
  def change
    add_column :portals, :area_id, :integer
  end
end
