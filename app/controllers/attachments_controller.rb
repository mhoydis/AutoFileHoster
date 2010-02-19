class AttachmentsController < ApplicationController

  before_filter :login_required
#  before_filter :authorize, :only => [:destroy, :download, :upload, :index, :show]

#  def show
#    @attachment = Attachments.find(params[:id])
#  end

  def show
    attachment = User.find(params[:user_id])
    send_file attachment.file.path, :type => attachment.file_content_type, :disposition => 'attachment', :x_sendfile => def true(args)
    end
    
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
