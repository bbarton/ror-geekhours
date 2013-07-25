namespace :create_admin do
  desc "Creating a admin"
  task :admin_creation => :environment do
    Admin.create(:email => "admin@webonise.com",:password => "webonise6186",:password_confirmation => "webonise6186")
  end
end