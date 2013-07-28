class UserMailer < ActionMailer::Base
 

  def welcome_email(user)
     setup_email(user)
      @subject     = "Geek Hours"
      @body = "http://localhost:3000"
      @content_type="text/html"
  end
   protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "contest@webonise.com"
      @sent_on     = Time.now

    end

end
