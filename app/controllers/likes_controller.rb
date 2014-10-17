class LikesController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    current_user.liked_images << @image

    redirect_to [@image.gallery, @image]
  end

  def destroy
    @image = Image.find(params[:image_id])
    @image.users.delete(current_user)

    redirect_to [@image.gallery, @image]
  end
end
