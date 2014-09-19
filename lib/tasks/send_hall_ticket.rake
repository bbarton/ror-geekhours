desc "Send Hall ticket with email"
task :send_hall_ticket => :environment do
  users = User.all
  users.each do |user|
    secondary_users = user.secondary_users
    AdminMailer.delay.send_hall_ticket(user, secondary_users)
  end
end