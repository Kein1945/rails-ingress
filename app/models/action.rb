class Action < ActiveRecord::Base
  attr_accessible :action_at, :deploy, :destroy, :player_id, :portal_id
  belongs_to :player

  def self.byPlayer(player_id)
  	actions = find(:all, :conditions => ['player_id = ?', player_id], :order => 'action_at')
  	actions
  end
end
