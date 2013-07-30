class AdminMailer < ActionMailer::Base
  default from: "vivek@webonise.com"

  def send_invite (email)
    mail(:to =>email,:from=>"vivek@webonise.com",:content_type=> 'text/html')
  end
end
