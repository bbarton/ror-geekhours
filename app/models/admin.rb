class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password,:password_confirmation

  def self.send_invite
    csv_data = File.open("#{Rails.public_path}/mailer_list.csv")
    email_list = []
    csv_data.each do |email|
     email_list << email
    end
    email_list.each do |mail|
      AdminMailer.send_invite(mail).deliver
    end


  end

  end
