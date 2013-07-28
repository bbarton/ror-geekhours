class UsersController < ApplicationController
  def index
    @user = User.new
    logger.info "================COMING HERE ========================"
    3.times{ @user.secondary_users.build }
  end

  def create
    email = params[:user][:email].split("@")
    logger.info("1111111#{email}")
    exist_user = User.find_by_email params[:user][:email]
    respond_to do |format|
      if email[1].downcase == "yopmail.com" || email[1] == "mailinator.com" || email[1] == "mailcatch.com" || email[1] == "dudmail.com"
        logger.info("sadasdasdasdd#{email}")
        flash[:notice] = "Invalid email domain #{email[1]}."
        format.html {  redirect_to root_path }
        format.js
      else
        @user = User.new(params[:user])
        logger.info "########################{params["user"]["secondary_users_attributes"]}###################"
        params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}
      if @user.save
          UserMailer.welcome_email(@user).deliver
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

