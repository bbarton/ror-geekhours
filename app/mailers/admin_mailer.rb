class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invite (email)
  mail(:to =>email,:from=>"contest@webonise.com",:content_type=> 'text/html')
  end
end
