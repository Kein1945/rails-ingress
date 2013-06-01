class CustomPlayerInformation < ActiveRecord::Migration
  def change
  	add_column	:players, :phone, :string
  	add_column	:players, :location, :string
  	add_column	:players, :transport, :string
  end
end
