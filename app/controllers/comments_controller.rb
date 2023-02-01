class CommentsController < ApplicationController
  before_action :set_book!
  before_action :set_comment!, except: :create

  
  def create
    @comment = @book.comments.build comment_params
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to book_path(@book)
    else
      @comments = @book.comments.order created_at: :desc
      render 'books/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to book_path(@book)
  end

  def edit
  end

  def update
    if @comment.update comment_params
      flash[:success] = 'Comment update!'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def set_book!
    @book = Book.find params[:book_id]
  end

  def set_comment!
    @comment = @book.comments.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end