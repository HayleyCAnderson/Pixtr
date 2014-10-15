class GalleriesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.create(gallery_params)

    if @gallery.valid?
      redirect_to @gallery
    else
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)

    redirect_to @gallery
  end
  
  def destroy
    Gallery.find(params[:id]).destroy
    
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end