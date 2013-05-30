class ActionsController < ApplicationController
  def index
  	@player = Player.find(params[:player_id])
  	unless @player
  		flash[:notice] = "The player you were looking for could not be found."
    	redirect_to root_path
  	end

  	actions = Action.find(:all, :conditions => ['player_id = ?', @player.id], :order => 'action_at')
  		# .group_by{ |r| r.action_at.strftime('%Y %m %d') }.values.flatten
  	hourly_actions = actions.group_by{ |r| r.action_at.strftime('%H')}

  	@actions = {
  		:deploy_ap => actions.collect{ |r| { :date => r.action_at, :activity => r.deploy_ap } } ,
  		:destroy_ap => actions.collect{ |r| { :date => r.action_at, :activity => r.destroy_ap } },
  		:deployes => actions.collect{ |r| { :date => r.action_at, :activity => r.deployes } },
  		:destroyes => actions.collect{ |r| { :date => r.action_at, :activity => r.destroyes } },
  		:usage_points => actions.collect{ |r| { :date => r.action_at, :activity => r.destroyes.to_i + r.deployes.to_i } },
  		:action_points => actions.collect{ |r| { :date => r.action_at, :activity => r.destroy_ap.to_i + r.deploy_ap.to_i } }
  	}
  	@hourly_actions = hourly_actions.to_a
  		.collect{ |r| { :hour => r[0], :activity => r[1].collect{|r| r.destroyes.to_i + r.deployes.to_i}.sum } }
  		.sort{ |a, b| a[:hour].to_i <=> b[:hour].to_i }
  end
end
