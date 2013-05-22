class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :fraction
      t.integer :level
      t.string :realname
      t.string :gplus
      t.string :vk
      t.text :comments

      t.timestamps
    end
  end
end
