class AdminsController < ApplicationController
  def index
    logger.info "################{current_admin.inspect}"
     if current_admin.present?
      flash[:success] = "Successfully Sign In"
      @users = User.all

     else
       (flash[:success]= "You need to Sign in")
     end
  end
end
