class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :index]

  def index
    @books = Book.paginate(page: params[:page])
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
  end

  def create
    @book = Book.create(book_params)
    @authors = author_params[:authors].reject(&:empty?)
    @categories = category_params[:categories].reject(&:empty?)
    if @book.save
      @authors.each do |author|
        @book.authorships.create([book_id: @book.id, author_id: author])
      end

      @categories.each do |category|
        @book.categorizations.create([book_id: @book.id, category_id: category])
      end

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
    params.require(:book).permit(:name, :description, :image)
  end

  def author_params
    params.require(:book).permit(authors: [])
  end

  def category_params
    params.require(:book).permit(categories: [])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

