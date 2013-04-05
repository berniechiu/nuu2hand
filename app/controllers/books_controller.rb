class BooksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
  	@book = current_user.books.build(params[:book])
  	if @book.save
  	  flash[:success] = "Book posted!"
  	  redirect_to root_path
  	else
  	  render 'static_pages/home'
  	end
  end

  def destroy
  end
end