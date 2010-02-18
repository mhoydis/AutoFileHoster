class AttachmentsController < ApplicationController

  before_filter :login_required
#  before_filter :authorize, :only => [:destroy, :download, :upload, :index, :show]

#  def show
#    @attachment = Attachments.find(params[:id])
#  end

  def show
    attachment = User.find(params[:id])
 #   send_file attachment.data.path, :type => attachment.data_content_type, :disposition => 'attachment', :x_sendfile => true
  end


  def index
    respond_to do |format|
      format.html
    end
  end

  def upload
    respond_to do |format|
      format.html
    end
  end

  def download
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
      user = User.find(params[:user_id])
      user.file = nil
      user.save!
      redirect_to user
  end
  

end
