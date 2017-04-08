class PagesController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.find_categories(Category.first)
  end
end
