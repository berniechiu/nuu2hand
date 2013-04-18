class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(params[:comment]) if signed_in?
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end

end