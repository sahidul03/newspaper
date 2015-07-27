class VideosController < ApplicationController

  def index
    @videos=Video.all.reverse_order.page(params[:page]).per(9)
    @post=Post.first
   render layout: 'admin_layout'
  end

  def show
    @video=Video.find(params[:id])
    render layout: 'admin_layout'
  end

  def new
    @video=Video.new
    render layout: 'admin_layout'
  end

  def edit
    @video=Video.find(params[:id])
    render layout: 'admin_layout'
  end

  def create
    @video=Video.new(params_video)
    if @video.save
      flash[:notice] = "Video uploaded successfully."
      redirect_to videos_path
    else
      flash[:alert] = "Video url can't be blank."
      redirect_to new_video_path(@video)
    end
  end
  def update
    @video=Video.find(params[:id])
    if @video.update(params_video)
      flash[:notice] = "Video updated successfully."
      redirect_to video_path(@video)
    else
      flash[:alert] = "Video url can't be blank."
      redirect_to edit_video_path(@video)
    end
  end

  def destroy
    @video=Video.find(params[:id])
    if @video.destroy
      flash[:notice] = "Video deleted successfully."
      redirect_to videos_path
    end
  end

  private

  def params_video
    params.require(:video).permit(:title,:url)
  end

end
