class BottomCategoryNewsController < ApplicationController
  def index
    @bottom_category_news=BottomCategoryNews.new
    @all_bottom_category_news=BottomCategoryNews.all
    render layout: 'admin_layout'
  end

  def create
    @bottom_category_news=BottomCategoryNews.new(:category_id=>params[:category_id])
    if @bottom_category_news.save
      flash[:notice] = "Bottom category added successfully."
    else
      flash[:alert] = "Please Select an unique category."
    end
    redirect_to bottom_category_news_index_path
  end

  def destroy
    @bottom_category_news=BottomCategoryNews.find(params[:id])
    if @bottom_category_news.destroy
      flash[:notice] = "Bottom category deleted successfully."
    end
    redirect_to bottom_category_news_index_path
  end

end
