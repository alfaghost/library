class AuthorshipsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @author = Author.find(params[:id])
    @book.add_author!(@author)
    # redirect_to books_url
  end

  def destroy
    @book = Book.find(params[:id])
    @author = Authorship.find(params[:id]).author
    @book.remove_author!(@author)
  end
end


