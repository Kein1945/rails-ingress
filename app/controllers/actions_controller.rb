class ActionsController < ApplicationController
  def index
  	@player = Player.find(params[:player_id])
  	unless @player
  		flash[:notice] = "The player you were looking for could not be found."
    	redirect_to root_path
  	end
  end

  def daily
    actions = Action.byPlayer(params[:player_id])

    grouped_actions = {
      :deploy_ap => actions.collect{ |r| [ r.action_at.to_i*1000, r.deploy_ap.to_i ] } ,
      :destroy_ap => actions.collect{ |r| [ r.action_at.to_i*1000,  r.destroy_ap.to_i ] },
      :deployes => actions.collect{ |r| [ r.action_at.to_i*1000, r.deployes.to_i ]},
      :destroyes => actions.collect{ |r| [r.action_at.to_i*1000, r.destroyes.to_i ] },
      :usage_points => actions.collect{ |r| [ r.action_at.to_i*1000, r.destroyes.to_i + r.deployes.to_i] },
      :action_points => actions.collect{ |r| [ r.action_at.to_i*1000, r.destroy_ap.to_i + r.deploy_ap.to_i] }
    }

    @actions = grouped_actions.collect do |name, actions_by_type|
      {
        :name => name,
        :type => (name == :usage_points or name == :action_points) ? 'spline' : 'column',
        :data => actions_by_type
      }
    end
    respond_to do |format|
      format.json { render :json => @actions }
    end
  end

  def hour
    actions = Action.byPlayer(params[:player_id])
    hourly_actions = actions.group_by{ |r| r.action_at.strftime('%H').to_i}

    hourly = hourly_actions.to_a
      .collect{ |r| [ r[0], r[1].collect{|r| r.destroyes.to_i + r.deployes.to_i}.sum ] }
      .sort{ |a, b| a[0] <=> b[0] }

    respond_to do |format|
      format.json { render :json => hourly }
    end
  end
end
