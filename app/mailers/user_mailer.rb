class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_instr(user)
   logger.info "=============I AM COMING HERE=========="
   mail(:to =>user.email,:subject=>"Registered Successfully")
  end
end
