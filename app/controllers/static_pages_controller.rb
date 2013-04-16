class StaticPagesController < ApplicationController
  def home
  	@books = Book.search(params[:search])
  	             .paginate(page: params[:page], per_page: 10)
  end

  def about
  end

  def contact
  end
end
