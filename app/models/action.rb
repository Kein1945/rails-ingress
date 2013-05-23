class Action < ActiveRecord::Base
  attr_accessible :action_at, :deploy, :destroy, :player_id, :portal_id
  belongs_to :player
end
