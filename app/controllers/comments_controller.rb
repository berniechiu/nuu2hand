class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(params[:comment]) if signed_in?
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment posted"
      redirect_to book_path(@book)
    else
      render book_path(@book)
    end
  end

  def destroy
  end
end