class GalleriesController < ApplicationController

  def index
    @gallery=Gallery.all
    render layout: 'admin_layout'
  end

  def new
    @gallery=Gallery.new
    render layout: 'admin_layout'
  end
  def edit
    @gallery=Gallery.find(params[:id])
    render layout: 'admin_layout'
  end

  def show
    @gallery=Gallery.find(params[:id]) rescue nil
    unless @gallery
      redirect_to galleries_path
    else
      render layout: 'admin_layout'
    end
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

  def update
    @gallery=Gallery.find(params[:id])
    if @gallery.update(:title=>params[:gallery][:title])
      flash[:notice] = "Gallery name updated successfully."
      redirect_to gallery_path(@gallery)
    else
      flash[:alert] = "Gallery name can't be blank."
      redirect_to edit_gallery_path(@gallery)
    end
  end

  def destroy
    @gallery=Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Gallery deleted successfully."
    redirect_to galleries_path
  end

end
