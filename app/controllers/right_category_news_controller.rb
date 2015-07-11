class RightCategoryNewsController < ApplicationController
  def index
    @right_category_news=RightCategoryNews.new
    @all_right_category_news=RightCategoryNews.all
    render layout: 'admin_layout'
  end

  def create
    @right_category_news=RightCategoryNews.new(:category_id=>params[:category_id])
    if @right_category_news.save
      flash[:notice] = "Right side category added successfully."
    else
      flash[:alert] = "Please Select an unique category."
    end
    redirect_to right_category_news_index_path
  end

  def destroy
    @right_category_news=RightCategoryNews.find(params[:id])
    if @right_category_news.destroy
      flash[:notice] = "Right side category deleted successfully."
    end
    redirect_to right_category_news_index_path
  end

end
