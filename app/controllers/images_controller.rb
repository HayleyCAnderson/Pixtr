class ImagesController < ApplicationController
  before_action :require_login, except: :show

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)
    @image.user = current_user
    
    if @image.save
      redirect_to gallery_image_path(@gallery, @image)
    else
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    @image.update(image_params)

    redirect_to gallery_image_path(@gallery, @image)
  end
  
  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    @image.destroy
    
    redirect_to @gallery
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url)
  end
end
