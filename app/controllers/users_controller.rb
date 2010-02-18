class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  
  before_filter :login_required
  before_filter :authorize, :only => [:create, :new, :edit, :update, :destroy]
  
  
  def show
    @user = User.find(params[:id])
  end
 
  def create
    # this handles the POST
    @user = User.new(params[:user])
    @user.save
    respond_to do |format|
      format.html {redirect_to(@user)}
    end
  end


  def new
    # This handles the GET
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def index
    @users = User.all
  end



  def edit
  # This handles the GET
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
  # This handles the POST
    @user = User.find(params[:id]) 
    @user.update_attributes(params[:user])
    respond_to do |format|
      format.html {redirect_to(@user)}
    end
  end

  def destroy
    # This handles a POST
    @user = User.find(params[:id])
    @user.delete
    respond_to do |format|
      format.html {redirect_to(users_path)}
    end
  end
  
  
  

end
