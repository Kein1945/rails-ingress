class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.string :name
      t.string :address
      t.string :uid
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
    add_index :portals, :uid,                :unique => true
    add_index :portals, [:lat, :lng]
  end
end
