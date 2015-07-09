class PhotosController < ApplicationController


  def new
    @gallery=Gallery.find(params[:gallery_id])
    @photo=@gallery.photos.new
    render layout: 'admin_layout'
  end

  def edit
    @gallery=Gallery.find(params[:gallery_id])
    @photo=Photo.find(params[:id])
    render layout: 'admin_layout'
  end

  def create
    @gallery=Gallery.find(params[:gallery_id])
    @photo=@gallery.photos.build(params_photo)
    if @photo.save
      flash[:notice] = "Photo added successfully."
      redirect_to gallery_path(@gallery)
    else
      flash[:alert] = "Please select an image."
      redirect_to new_gallery_photo_path(@gallery,@photo)
    end
  end
  def update
    @gallery=Gallery.find(params[:gallery_id])
    @photo=Photo.find(params[:id])
    if @photo.update(params_photo)
      flash[:notice] = "Photo updated successfully."
      redirect_to gallery_path(@gallery)
    else
      flash[:alert] = "Please select an image."
      redirect_to edit_gallery_photo_path(@gallery,@photo)
    end
  end

  def destroy
    @photo=Photo.find(params[:id])
    @gallery=@photo.gallery
    @photo.destroy
    flash[:notice] = "Photo deleted successfully."
    redirect_to gallery_path(@gallery)
  end
 private
  def params_photo
    params.require(:photo).permit(:title,:image)
  end

end
