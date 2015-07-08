class GalleriesController < ApplicationController

  def index
    @gallery=Gallery.all
    render layout: 'admin_layout'
  end

  def new
    @gallery=Gallery.new
    render layout: 'admin_layout'
  end

  def create
    @gallery=Gallery.new
    @gallery.title=params[:gallery][:title]
    if @gallery.save
      # raise @user.inspect
      if params[:gallery][:files].any?
        # index=0
        params[:gallery][:files].each do |im|
          Photo.create(:gallery_id=>@gallery.id,:image=>im)
        end
      end
      flash[:notice] = "Photo Gallery created successfully."
      redirect_to galleries_path
    else
      flash[:alert] = "Gallery name can't be blank."
      redirect_to new_gallery_path
    end
  end

  def destroy
    @gallery=Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Gallery deleted successfully."
    redirect_to galleries_path
  end

end
