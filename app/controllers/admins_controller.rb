class AdminsController < ApplicationController
  def index
     if current_admin.present?
      flash[:success] = "Successfully Sign In"
      @users = User.all

     else
       (flash[:success]= "You need to Sign in")
     end
  end

  def user_details

  end
end
