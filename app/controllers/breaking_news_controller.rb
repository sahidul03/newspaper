class BreakingNewsController < ApplicationController

  def index
    @breaking_news=BreakingNews.all
    @br_news=BreakingNews.new
    render layout: 'admin_layout'
  end

  def create
    @br_news=BreakingNews.new(params_breaking_news)
    if @br_news.save
      flash[:notice] = "Breaking added successfully."
    else
      flash[:alert] = "Title can't be blank."
    end
    redirect_to breaking_news_index_path
  end

  def destroy
    @br_news=BreakingNews.find(params[:id])
    if @br_news.destroy
      redirect_to breaking_news_index_path
    end
  end

  private
  def params_breaking_news
    params.require(:breaking_news).permit(:title);
  end

end
