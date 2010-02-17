class AttachmentsController < ApplicationController

  def show
    @attachment = Attachments.find(params[:id])
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
