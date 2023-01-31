class CommentsController < ApplicationController
  before_action :set_book!
  
  def create
    @comment = @book.comments.build comment_params
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  def destroy
    comment = @book.comments.find params[:id]
    comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to book_path(@book)
  end

  private

  def set_book!
    @book = Book.find params[:book_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end