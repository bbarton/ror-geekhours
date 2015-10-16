desc "Send Hall ticket with email"
task :send_hall_ticket => :environment do
  User.all.each do |user|
    AdminMailer.delay.send_hall_ticket(user)
  end
end
