class UserMailer < ActionMailer::Base
  default from: "contest@webonise.com"
  def welcome_email(user)
     setup_email(user)
      #@subject     = "Geek Hours"
      #@body = "http://localhost:3000"
      #@content_type="text/html"
  end

  protected
  def setup_email(user)
    mail(:to=>user.email,:from=> "pansingh@webonise.com",:sent_on=> Time.now,:subject=>"Geek Hours welcome email",:content_type=>"text/html")
  end
end

