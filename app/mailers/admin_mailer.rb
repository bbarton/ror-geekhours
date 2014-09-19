class AdminMailer < ActionMailer::Base
  default from: "vivek@webonise.com"

  def send_invite (email)
    mail(:to =>email,:from=>"vivek@webonise.com",:content_type=> 'text/html')
  end

  def send_hall_ticket(user, secondary_users)
    @user = user
    @secondary_users = secondary_users
  end
end
