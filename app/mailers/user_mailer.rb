class UserMailer < ActionMailer::Base
  default from: "contest@webonise.com"
  def welcome_email(user)
     setup_email(user)
      #@subject     = "Geek Hours"
      #@body = "http://localhost:3000"
      #@content_type="text/html"
  end

  def welcome_secondary_email(secondary_user)
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

