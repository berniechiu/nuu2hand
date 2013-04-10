class BooksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
  	@books = Book.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@book = current_user.books.build(params[:book])
  end

  def create
  	@book = current_user.books.build(params[:book]) if signed_in?
  	if @book.save
  	  flash[:success] = "Book posted!"
  	  redirect_to books_path
  	else
  	  render 'new'
  	end
  end

  def edit  
  end

  def update
    if @book.update_attributes(params[:book])
      flash[:success] = "Book information updated"
      redirect_to books_path
    else 
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @book = current_user.books.find_by_id(params[:id])
      redirect_to root_path if @book.nil?
    end
end