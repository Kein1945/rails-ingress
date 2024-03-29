class PlayersController < ApplicationController
  load_and_authorize_resource
  
  before_filter :authenticate_user!
  # GET /players
  # GET /players.json
  def index
    #@players = Player.order(:created_at).limit(10)
    @players = Player.search(params[:search]).order("name").paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end


  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
end
