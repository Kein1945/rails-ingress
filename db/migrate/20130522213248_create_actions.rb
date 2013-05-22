class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :action_at
      t.integer :player_id
      t.integer :portal_id
      t.string :deploy
      t.string :destroy
    end
  end
end
