class SpecialNewsController < ApplicationController

  def index
    @current_date=Date.today
    @posts=Post.where(["created_at > ?", 48.hours.ago])
    @categories=Category.all
    @special_news=SpecialNews.all
    @sp_new=SpecialNews.new
    render layout: 'admin_layout'
  end

  def create
    @sp_news=SpecialNews.new(:post_id=>params[:post_id])
    if @sp_news.save
      flash[:notice] = "Special News added successfully."
    else
      flash[:alert] = "Please select an unique News."
    end
    redirect_to special_news_index_path
  end

  def destroy
    @sp_news=SpecialNews.find(params[:id])
    if @sp_news.destroy
      flash[:notice] = "Special news deleted successfully."
      redirect_to special_news_index_path
    end
  end

end
