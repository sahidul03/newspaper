class NewsController < ApplicationController
  before_action :authenticate_user!, :except => [:show,:category_news,:video_gallery, :photo_gallery,:division, :archive,:previous_record]
  def index

  end

  def show
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_news=Post.find(params[:id])
    view_count=@single_news.view_count
    view_count=view_count+1
    @single_news.update(:view_count=>view_count)
    render layout: 'user_layout'
  end

  def category_news
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_category=Category.find(params[:id])
    @category_news=@single_category.posts.last(25).reverse
    render layout: 'user_layout'
  end

  def video_gallery
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_video=Video.find(params[:id])
    @all_videos=Video.page(params[:page]).per(18)
    render layout: 'user_layout'
  end

  def photo_gallery
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_gallery=Gallery.find(params[:id])
    @all_galleries=Gallery.page(params[:page]).per(18)
    render layout: 'user_layout'
  end

  def division
    @sp_news=SpecialNews.last(4)
    @sl_news=SliderNews.all
    @last_ten_news=Post.last(10)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    @single_division=Division.find(params[:id])
    @division_news=@single_division.posts.last(25)
    render layout: 'user_layout'
  end

  def archive
    @current_date=Date.today
    @archive_news=Post.where("DATE(created_at) = ?", Date.today)
    @most_viewed_news= Post.order(view_count: :desc).first(9)
    render layout: 'user_layout'
  end

  def previous_record
    @current_date=params[:date]
    @category_id=params[:category]
    if @category_id!=''
      @category=Category.find(@category_id)
      @archive_news=@category.posts.where("DATE(created_at) = ?", @current_date)
    else
      @archive_news=Post.where("DATE(created_at) = ?", @current_date)
    end
  end


end
