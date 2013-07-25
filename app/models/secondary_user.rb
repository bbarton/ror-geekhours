class SecondaryUser < ActiveRecord::Base
  belongs_to :User
  attr_accessible :email, :name
  validate :email, :uniqueness => true
end
