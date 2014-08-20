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
           UserMailer.delay.welcome_email(User.last)
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

  def guest_user
    @guest_user = GuestUser.new
  end

  def create_guest_user
    @guest_user = GuestUser.new(params[:guest_user])
    if @guest_user.save
      redirect_to thank_you_path
    else
      render :action => "guest_user", :alert => "User can't be save'"
    end
  end

  def thank_you

  end

end

