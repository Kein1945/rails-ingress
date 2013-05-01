class Portal < ActiveRecord::Base
  attr_accessible :address, :lat, :lng, :name, :uid
end
