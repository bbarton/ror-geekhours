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
      flash[:notice] = "Invalid Email Id"
      redirect_to users_path
   elsif SecondaryUser.find_by_email(params[:user][:email]).present?
      flash[:notice] = "Email already present"
      redirect_to users_path
    else
      @user = User.create(params[:user])

      @user.save
      params["user"]["secondary_users_attributes"].each{|key,value| @user.secondary_users.build(value)}

      if simple_captcha_valid?
        flash[:notice] = "Thank you.Registered successfully."
        redirect_to users_path
      else
        render :json => {:message => "not valid"}
      end
    end


  end
end
