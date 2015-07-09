class HeadlinesController < ApplicationController

  def index
    @current_date=Date.today
    @posts=Post.where(["created_at > ?", 48.hours.ago])
    @categories=Category.all
    @headlines=Headline.all
    @headline=Headline.new
    render layout: 'admin_layout'
  end

  def create
    @headline=Headline.new(:post_id=>params[:post_id])
    if @headline.save
      flash[:notice] = "Headline added successfully."
    else
      flash[:alert] = "Please select an unique News."
    end
    redirect_to headlines_path
  end

  def destroy
    @headline=Headline.find(params[:id])
    if @headline.destroy
      flash[:notice] = "Headline deleted successfully."
      redirect_to headlines_path
    end
  end

  def post_search_for_headline
    @current_date=params[:date]
    @category_id=params[:category_id]
    if @category_id!=''
      @category=Category.find(@category_id)
      @posts=@category.posts.where("DATE(created_at) = ?", @current_date)
    else
      @posts=Post.where("DATE(created_at) = ?", @current_date)
    end

  end

end
