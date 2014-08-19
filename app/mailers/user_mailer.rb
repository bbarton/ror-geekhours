class UserMailer < ActionMailer::Base
  default from: "contest@webonise.com"
  def welcome_email(user)
     @username = user.name
     setup_email(user)
  end

  def welcome_secondary_email(secondary_user,user)
     @user = user
     setup_secondary_email(secondary_user)
  end


  protected
  def setup_email(user)
    mail(:to=>user.email,:sent_on=> Time.now,:subject=>"Geek Hours welcome email",:content_type=>"text/html")
  end

  def setup_secondary_email(secondary_user)
    mail(:to=>secondary_user.email,:sent_on=> Time.now,:subject=>"Geek Hours welcome email",:content_type=>"text/html")
  end
end

