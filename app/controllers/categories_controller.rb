class CategoriesController < ApplicationController

  # after_action :layout_load, only: [:index, :show, :edit, :new]

  def index
    @categories=Category.all
    render layout: 'admin_layout'
  end

  def show
    @category=Category.find(params[:id]) rescue nil
    unless @category
      redirect_to posts_path
    else
      @posts=@category.posts.last(30)
    end
    render layout: 'admin_layout'
  end

  def new
     @category=Category.new
     render layout: 'admin_layout'
  end

  def create
    @category=Category.new(params_category)
    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to categories_path
    else
      flash[:alert] = "Category name can't be blank."
      redirect_to new_category_path
    end
  end

  def edit
    @category=Category.find(params[:id]) rescue nil
    if @category.nil?
      redirect_to categories_path
    end
    render layout: 'admin_layout'
  end

  def update
    @category=Category.find(params[:id])
    if @category.update(params_category)
      flash[:notice] = "Category updated successfully."
      redirect_to categories_path
    else
      flash[:alert] = "Category name can't be blank."
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category deleted successfully."
    redirect_to categories_path
  end


  private

  def layout_load
    render layout: 'admin_layout'
  end

  def params_category
    params.require(:category).permit(:name)
  end

end
