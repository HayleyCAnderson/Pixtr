class CommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @gallery = Gallery.find(@image.gallery_id)
    @comment = @image.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to gallery_image_path(@gallery, @image)
  end

  private

  def comment_params
    params.require(:comment).permit(:contents)
  end
end