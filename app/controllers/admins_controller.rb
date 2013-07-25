class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
  #def index
  #  @admins = Admin.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @admins }
  #  end
  #end
  #
  ## GET /admins/1
  ## GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  #def new
  #  @admin = Admin.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @admin }
  #  end
  #end
  #
  ## GET /admins/1/edit
  #def edit
  #  @admin = Admin.find(params[:id])
  #end
  #
  ## POST /admins
  ## POST /admins.json
  #def create
  #  @admin = Admin.new(params[:admin])
  #
  #  respond_to do |format|
  #    if @admin.save
  #      format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
  #      format.json { render json: @admin, status: :created, location: @admin }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @admin.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  def login
    #@admin = Admin.find(params[:email])
    #if @admin.present?
    #  #admin.password == params[:password]? (redirect_to admin_login_path)  :  (redirect_to admin_path(@admin))
    #else
    #  render :json=>{:message =>"user doesn't exist"}
    #end
  end

  def confirm_admin
    logger.info "###################I AM COMING HERE ###########################3"
    @admin = Admin.find_by_email(params[:email])
    logger.info "##################################{@admin.inspect}"
    if @admin.present?
      admin.password == params[:password]? (redirect_to  login_admins_path)  :  (redirect_to admin_path(@admin))
    else
      render :json=>{:message =>"user doesn't exist"}
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  #def update
  #  @admin = Admin.find(params[:id])
  #
  #  respond_to do |format|
  #    if @admin.update_attributes(params[:admin])
  #      format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @admin.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /admins/1
  ## DELETE /admins/1.json
  #def destroy
  #  @admin = Admin.find(params[:id])
  #  @admin.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to admins_url }
  #    format.json { head :no_content }
  #  end
  #end
end
