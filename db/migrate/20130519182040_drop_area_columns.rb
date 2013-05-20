class DropAreaColumns < ActiveRecord::Migration
  def up
  	remove_column :areas, :BRLat
  	remove_column :areas, :BRLng
  	remove_column :areas, :LTLat
  	remove_column :areas, :LTLng
  end

  def down
  	add_column :areas, :BRLat
  	add_column :areas, :BRLng
  	add_column :areas, :LTLat
  	add_column :areas, :LTLng
  end
end
