require 'mail'
require 'csv'
class AdminsController < ApplicationController
  def index
     if current_admin.present?
      flash[:success] = "Successfully Sign In"
      @users = User.all

     else
       flash[:success]= "You need to Sign in"
       redirect_to root_path
     end
  end

  def user_details
     @user = User.find(params[:id])
  end

end
