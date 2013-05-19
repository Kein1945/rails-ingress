class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :LTLat
      t.integer :LTLng
      t.integer :BRLat
      t.integer :BRLng
      t.string :name
    end
  end
end
