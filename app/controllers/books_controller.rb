class BooksController < ApplicationController
    before_action :set_book, only: %i[show edit update destroy]

    def index
      @books = Book.all
    end

    def show
      @book = Book.find(params[:id])
      @borrowings = @book.borrowings.order(borrowed_at: :desc)
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: "Book successfully added."
      else
        render :new
      end
    end

    def edit; end

    def update
      if @book.update(book_params)
        redirect_to @book, notice: "Book updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @book.destroy
      redirect_to books_path, notice: "Book removed successfully."
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :available)
    end
end
