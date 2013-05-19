class Portal < ActiveRecord::Base
  attr_accessible :address, :lat, :lng, :name, :uid
  belongs_to :area
end
