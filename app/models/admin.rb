class Admin < ActiveRecord::Base
  attr_accessible :email, :password
end
