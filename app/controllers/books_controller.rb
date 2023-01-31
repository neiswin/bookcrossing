class BooksController < ApplicationController

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
    @book = Book.find_by id: params[:id]
    @book.destroy
    flash[:success] = 'Book deleted!'
    redirect_to books_path
  end

  def edit
    @book = Book.find_by id: params[:id]
  end
  
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find_by id: params[:id]
  end
  
  def update
    @book = Book.find_by id: params[:id]
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
end