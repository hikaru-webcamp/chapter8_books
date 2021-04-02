class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books =Book.all
     render "index"  # ルーティングを通らず、viewページに飛ぶ。アクションガン無視
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if
       flash[:notice] = "Book was successfully destroyed."
    book.destroy
    redirect_to books_path(book.id)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
