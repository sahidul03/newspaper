class PostsController < ApplicationController

  def index
    last_day_date=Date.yesterday
    # @posts=Post.where(:all, :conditions =>["date(created_at) BETWEEN ? AND ? ", 2.days.ago,Time.now])
    @posts=Post.last(40)
    render layout: 'admin_layout'
  end

  def show
    @post=Post.find(params[:id]) rescue nil
    if @post.nil?
      redirect_to posts_path
    end
    render layout: 'admin_layout'
  end

  def new
    @post=Post.new
    render layout: 'admin_layout'
  end

  def create
    @post=Post.new(params_post)
    if @post.save
      flash[:notice] = "News created successfully."
      redirect_to posts_path
    else
      unless params_post[:title].blank?
        unless params_post[:category_id].blank?
          unless params_post[:content].blank?
            flash[:notice] = "Please fill-up the form with valid data."
            else
              flash[:notice] = "News body can't be blank."
            end
          else
            flash[:notice] = "Category can't be blank."
          end
      else
        flash[:notice] = "Title can't be blank."
      end
      redirect_to new_post_path
    end
  end

  def edit
    @post=Post.find(params[:id]) rescue nil
    unless @post
      redirect_to posts_path
    end
    render layout: 'admin_layout'
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(params_post)
      flash[:notice] = "News updated successfully."
      redirect_to posts_path
    else
      unless params_post[:title].blank?
        unless params_post[:category_id].blank?
          unless params_post[:content].blank?
            flash[:notice] = "Please fill-up the form with valid data."
          else
            flash[:notice] = "News body can't be blank."
          end
        else
          flash[:notice] = "Category can't be blank."
        end
      else
        flash[:notice] = "Title can't be blank."
      end
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    flash[:notice] = "News deleted successfully."
    redirect_to posts_path
  end

  def post_search
    @searched_posts=Post.where("title like ?", "%#{params[:search_string]}%").first(15)
  end

  private

  def params_post
    params.require(:post).permit(:title,:content,:photo,:video).merge(:category_id=>params[:category_id],:division_id=>params[:division_id])
  end

end
