class UsersController < ApplicationController
  def index
    @user = User.new
    logger.info "================COMING HERE ========================"
    3.times{ @user.secondary_users.build }
  end

  def create
    email = params[:user][:email].split("@")
    exist_user = User.find_by_email params[:user][:email]
    if email[1].downcase == "yopmail.com" || email[1] == "mailinator.com" || email[1] == "mailcatch.com" || email[1] == "dudmail.com"
      flash[:notice] = "Invalid email domain #{email[1]}."
      redirect_to root_path
    elsif SecondaryUser.find_by_email(params[:user][:email]).present?
      flash[:notice] = "Email already present"
      redirect_to root_path
    elsif simple_captcha_valid?
      if exist_user.present?
        flash[:notice] = "Email has already been taken"
        redirect_to root_path
      else
        @user = User.create(params[:user])
        logger.info "########################{params["user"]["secondary_users_attributes"]}###################"
        params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}
        #UserMailer.welcome_instr(@user).deliver
        redirect_to registered_user_users_path
      end
    else
      flash[:notice] = "Code is not valid.Please reenter the code."
      redirect_to root_path
    end

  end

  def registered_user

  end
end

