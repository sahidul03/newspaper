class LeftCategoryNewsController < ApplicationController

  def index
    @left_category_news=LeftCategoryNews.new
    @all_left_category_news=LeftCategoryNews.all
    render layout: 'admin_layout'
  end

  def create
    @left_category_news=LeftCategoryNews.new(:category_id=>params[:category_id])
    if @left_category_news.save
      flash[:notice] = "Left side category added successfully."
    else
      flash[:alert] = "Please Select an unique category."
    end
    redirect_to left_category_news_index_path
  end

  def destroy
    @left_category_news=LeftCategoryNews.find(params[:id])
    if @left_category_news.destroy
      flash[:notice] = "Left side category deleted successfully."
    end
    redirect_to left_category_news_index_path
  end

end
