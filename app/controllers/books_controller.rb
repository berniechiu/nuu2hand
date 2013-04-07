class BooksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  	@books = Book.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@book = current_user.books.build(params[:book])
  end

  def create
  	@book = current_user.books.build(params[:book])
  	if @book.save
  	  flash[:success] = "Book posted!"
  	  redirect_to books_path
  	else
  	  render 'static_pages/home'
  	end
  end

  def destroy
  end
end