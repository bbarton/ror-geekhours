class User < ActiveRecord::Base
  has_many :secondary_users
  attr_accessible :email, :name, :team_name
end
