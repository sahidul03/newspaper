class ArchivesController < ApplicationController

  def index
    @current_date=Date.today
    @posts=Post.where("DATE(created_at) = ?", Date.today)
    render layout: 'admin_layout'
  end

  def show
    @posts=Post.all
    render layout: 'admin_layout'
  end


  def previous_record
     @current_date=params[:date]
     @category_id=params[:category]
     if @category_id!=''
       @category=Category.find(@category_id)
       @posts=@category.posts.where("DATE(created_at) = ?", @current_date)
     else
       @posts=Post.where("DATE(created_at) = ?", @current_date)
     end
  end

end
