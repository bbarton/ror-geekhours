class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
    @user.secondary_users.build

  end

  def create
    if SecondaryUser.find_by_email(params[:user][:email]).present?
      flash[:notice] = "Email already present"
      redirect_to users_path
    elsif simple_captcha_valid?
      @user = User.create(params[:user])
      params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}
      redirect_to users_path
    else
      flash[:notice] = "Reenter Details"
      redirect_to user_path
    end
  end
end
