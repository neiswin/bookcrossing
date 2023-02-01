class BooksController < ApplicationController
  before_action :set_book!, only: %i[destroy edit show update]

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = 'Book added!'
      redirect_to books_path
    else
      
      render :new
    end
  end

  def destroy
    @book.destroy
    flash[:success] = 'Book deleted!'
    redirect_to books_path
  end

  def edit
  end
  
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end

  def show
    @comment = @book.comments.build
    @comments = @book.comments.order created_at: :desc
  end
  
  def update
    if @book.update book_params
      flash[:success] = 'Book update!'
      redirect_to books_path
    else
      render :edit
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

  def set_book!
    @book = Book.find params[:id]
  end
end