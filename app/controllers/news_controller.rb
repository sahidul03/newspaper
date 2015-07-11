class NewsController < ApplicationController
  before_action :authenticate_user!, :except => [:show,:category_news]
  def index

  end

  def show
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_news=Post.find(params[:id])
    render layout: 'user_layout'
  end

  def category_news
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_category=Category.find(params[:id])
    @category_news=@single_category.posts.last(15)
    render layout: 'user_layout'
  end

end