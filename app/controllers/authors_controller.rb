class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:edit, :update, :destroy, :index, :show]


  def index
    @authors = Author.paginate(page: params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to authors_url, :flash => { :success => "Author created!" }
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      flash[:success] = "Author updated"
      redirect_to authors_url
    else
      render 'edit'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:success] = "Author deleted"
    redirect_to authors_url
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
