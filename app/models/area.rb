class Area < ActiveRecord::Base
  attr_accessible :BRLat, :BRLng, :LTLat, :LTLng, :name
  has_many	:portals
end
