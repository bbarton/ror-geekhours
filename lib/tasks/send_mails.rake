require 'mail'
require 'csv'
desc "Send Multiple emails"
task :send_email => :environment do
  csv_data = File.open("#{Rails.public_path}/mailer_list.csv")
  Mail.defaults do
    delivery_method :smtp, { :address              => "smtp.sendgrid.net",
                             :port                 => 587,
                             :domain               => 'webonise.com',
                             :user_name            => 'bhuvan',
                             :password             => 'webonise6186',
                             :authentication       => 'plain',
                             :enable_starttls_auto => true }
  end

  csv_data.each do |email|
    mail = Mail.deliver do
      to email
      from 'pansingh@weboniselab.com'
      subject 'Geek hours welcome email'
      text_part do
        body 'Geek Hours welcome email'
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body 'Hi,
              We give you the opportunity to unleash the Geek inside you.
              Register now for the most awaited Hackathon "Geek Hours", organized by Webonise Lab.
              You may register individually or bring a team of four like minded people.'
      end
    end
  end
end