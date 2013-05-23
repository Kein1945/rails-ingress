class ActionsController < ApplicationController
  def index
  	@player = Player.find(params[:player_id])
  	unless @player
  		flash[:notice] = "The player you were looking for could not be found."
    	redirect_to root_path
  	end

  	@actions = Action.find(:all, :conditions => ['player_id = ?', @player.id], :order => 'action_at DESC', :limit=> 50)
  end
end
