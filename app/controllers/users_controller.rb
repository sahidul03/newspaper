class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  def index
    @sp_news=SpecialNews.last(4).reverse
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10).reverse
    @most_viewed_news= Post.order(view_count: :desc).first(9)
     render layout: 'user_layout'
  end


end
