class User < ActiveRecord::Base
  apply_simple_captcha
  has_many :secondary_users, :dependent => :destroy


  accepts_nested_attributes_for :secondary_users
  attr_accessible :email, :name, :team_name,:description,:secondary_users_attributes
  #validate :email, :uniqueness => true
  validates :email,:presence => {:message => "Your email is used to save your greeting."}, :allow_blank => true,:uniqueness => { :case_sensitive => false }

end
