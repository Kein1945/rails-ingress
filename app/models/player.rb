class Player < ActiveRecord::Base
  attr_accessible :comments, :fraction, :gplus, :level, :name, :realname, :vk, :location, :phone, :transport
  def self.search(search)
  	if search
  		where('name LIKE ?', "%#{search}%")
  	else
  		scoped
  	end
  end
end
