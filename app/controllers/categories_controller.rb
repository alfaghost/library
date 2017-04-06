class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :index]

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_url, :flash => { :success => "Category created!" }
    else
      render 'pages/welcome'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to categories_url
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end