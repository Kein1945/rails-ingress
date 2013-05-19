class Portal < ActiveRecord::Base
  attr_accessible :address, :lat, :lng, :name, :uid
  belong_to :area
end
