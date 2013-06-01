class PlayerConfirmation < ActiveRecord::Migration
  def change
  	add_column :users, :player_confirmation_code, :string
  	add_column :users, :player_id, :integer
  end
end
