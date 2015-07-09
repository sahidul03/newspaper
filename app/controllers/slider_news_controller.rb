class SliderNewsController < ApplicationController

  def index
    @current_date=Date.today
    @posts=Post.where(["created_at > ?", 48.hours.ago])
    @categories=Category.all
    @slider_news=SliderNews.all
    @sl_news=SliderNews.new
    render layout: 'admin_layout'
  end

  def create
    @sl_news=SliderNews.new(:post_id=>params[:post_id])
    if @sl_news.save
      flash[:notice] = "Slider News added successfully."
    else
      flash[:alert] = "Please select an unique News."
    end
    redirect_to slider_news_index_path
  end

  def destroy
    @sl_news=SliderNews.find(params[:id])
    if @sl_news.destroy
      flash[:notice] = "Slider news deleted successfully."
      redirect_to slider_news_index_path
    end
  end

end
