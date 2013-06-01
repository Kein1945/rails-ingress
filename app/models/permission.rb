class Permission < ActiveRecord::Base
  attr_accessible :action, :description, :name, :subject_class, :subject_id, :user_id
  has_and_belongs_to_many :users, :join_table => :users_permissions
end
