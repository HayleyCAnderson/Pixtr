class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
  end

  def create
    gallery_params = params.require(:gallery).permit(:name, :description)
    new_gallery = Gallery.create(gallery_params)
    redirect_to new_gallery_path
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    gallery_params = params.require(:gallery).permit(:name, :description)
    @gallery.update(gallery_params)
    redirect_to gallery_path
  end
  
  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to galleries_path
  end
end