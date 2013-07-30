class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password,:password_confirmation

  def self.send_invite
    csv_data = File.open("#{Rails.public_path}/mailer_list.csv")
    puts csv_data
    a = csv_data.to_a
    final_list = a.first.split(",")
    puts final_list
    final_list.each do |email|
      puts email
      AdminMailer.send_invite(email).deliver
    end
  end

end
