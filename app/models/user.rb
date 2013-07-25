class User < ActiveRecord::Base
  has_many :secondary_users, :dependent => :destroy

  accepts_nested_attributes_for :secondary_users
  attr_accessible :email, :name, :team_name,:secondary_users_attributes

end
