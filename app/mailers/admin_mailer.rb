class AdminMailer < ActionMailer::Base
  default from: "kvijay@weboniselab.com"

  def send_invite (email)
    mail(:to =>email, subject: "Webonise Lab : Geek Hours 2015!")
  end

  def send_hall_ticket(user, secondary_users)
    @user = user
    @secondary_users = secondary_users
    mail(:to => user.email, subject: "Super Coder: Hall Ticket of Geek Hours 2015!")
  end
end
