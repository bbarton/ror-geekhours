class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
    3.times{ @user.secondary_users.build }

  end

  def create
    logger.info"#{params[:user][:email].inspect}"
    email = params[:user][:email].split("@")
    if email[1].downcase == "yopmail.com" || email[1] == "mailinator.com" || email[1] == "mailcatch.com" || email[1] == "dudmail.com"
      flash[:notice] = "Invalid email domain #{email[1]}."
      redirect_to new_user_path
    elsif SecondaryUser.find_by_email(params[:user][:email]).present?
      flash[:notice] = "Email already present"
      redirect_to users_path
    elsif simple_captcha_valid?
      @user = User.create(params[:user])
      params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}
      flash[:notice] = "Thank you.Registered successfully."
      UserMailer.welcome_instr(@user).deliver
      redirect_to users_path
    else
      flash[:notice] = "Code is not valid.Please reenter the code."
      redirect_to new_user_path
    end
  end
end

