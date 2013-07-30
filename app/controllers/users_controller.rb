class UsersController < ApplicationController
  def index
    @user = User.new
    3.times{ @user.secondary_users.build }
  end

  def create
    email = params[:user][:email].split("@")
    exist_user = User.find_by_email params[:user][:email]
    respond_to do |format|
      if email[1].downcase == "yopmail.com" || email[1] == "mailinator.com" || email[1] == "mailcatch.com" || email[1] == "dudmail.com"
        flash[:notice] = "Invalid email domain #{email[1]}."
        format.html {  redirect_to root_path }
        format.js
      else
        @user = User.new(params[:user])
        if @user.save
          User.last.update_attributes(:name => User.last.name.capitalize)
          UserMailer.delay.welcome_email(@user)
          if @user.secondary_users.present?
            @user.secondary_users.each do |sec_user|
              UserMailer.delay.welcome_secondary_email(sec_user,@user.name)
            end
          end
          flash[:notice] = nil
          format.html { redirect_to registered_user_users_path}
          format.js
        else
          flash[:notice] = "Email Already Exists"
          format.html {  redirect_to root_path }
          format.js
        end

      end
    end
  end
end

