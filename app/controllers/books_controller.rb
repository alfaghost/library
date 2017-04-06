class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :index]

  def index
    @books = Book.paginate(page: params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_url, :flash => { :success => "Micropost created!" }
    else
      render 'pages/welcome'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated"
      redirect_to books_url
    else
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :description)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

