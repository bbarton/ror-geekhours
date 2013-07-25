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
    redirect_to users_path


  end
end
