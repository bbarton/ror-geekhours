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
    else
      @user = User.create(params[:user])

      @user.save
      params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}

      if simple_captcha_valid?
        redirect_to users_path
      else
        render :json => {:message => "not valid"}
      end
    end


  end
end
