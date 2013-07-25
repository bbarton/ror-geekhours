class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
    @user.secondary_users.build

  end

  def create
    @user = User.create(params[:user])
    @user.save
    @user.secondary_users.build(params[:user][:secondary_user])
    if simple_captcha_valid?
      redirect_to users_path
    else
      redirect_to new_user_path
    end



  end
end
