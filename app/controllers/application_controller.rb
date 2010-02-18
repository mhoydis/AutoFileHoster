# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Added here for restful_auth.  It otherwise normally lives in app/controllers/sessions_controller.rb
  include AuthenticatedSystem

  before_filter :login_required

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  
  def destroy
      @user = User.find(params[:user_id])
      @user.file = nil
      @user.save!
      redirect_to user
  end
  

helper_method :admin_or_owner_only?
helper_method :owner?

protected

  def authorize
    unless admin_or_owner_only?
      flash[:notice] = "Denied.  You are not the owner of this User, and you are not an Admin."
      redirect_to users_path and return 
      false
    end
  end

  def admin_or_owner_only?
     current_user.admin? || current_user.id == params[:id].to_i
  end

  def owner?
    current_user.id == params[:id].to_i
  end

#  protected
#  # Protect controllers with code like:
#  #   before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
#  def admin_required
#  current_user.respond_to?('is_admin') && current_user.send('is_admin')
#  end


  
end




