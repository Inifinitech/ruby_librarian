class BorrowingsController < ApplicationController
    before_action :set_book, only: %i[create return]
  
    def create
      if @book.borrowings.exists?(borrower_name: borrowing_params[:borrower_name], returned_at: nil)
        redirect_to @book, alert: "This borrower has already borrowed this book and hasn't returned it yet."
        return
      end

      @borrowing = nil
      ActiveRecord::Base.transaction do
        @borrowing = @book.borrowings.create!(
          borrower_name: borrowing_params[:borrower_name],
          borrowed_at: Time.current
        )
      end
    
      redirect_to @book, notice: 'Book borrowed successfully.'
    
    rescue ActiveRecord::RecordNotUnique
      redirect_to @book, alert: "This borrower has already borrowed this book."
    end
    
  
    def return
      borrowing = @book.borrowings.where(returned_at: nil).last
      if borrowing
        borrowing.update(returned_at: Time.current)
        redirect_to @book, notice: 'Book returned successfully.'
      else
        redirect_to @book, alert: 'No active borrowing found.'
      end
    end


    def history
        @borrower_name = params[:name]
        @borrowings = Borrowing.where(borrower_name: @borrower_name).order(borrowed_at: :desc)
    end 
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def borrowing_params
      params.require(:borrowing).permit(:borrower_name)
    end  
  end
  