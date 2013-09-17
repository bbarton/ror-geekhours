class GuestUser < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => {:message => "Email can't be blank"}
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :allow_blank => false, :unless => Proc.new {|user| user.email.blank?}
end
