class Borrowing < ApplicationRecord
  belongs_to :book

  validates :borrower_name, presence: true

  before_create :mark_book_as_unavailable
  before_update :mark_book_as_available, if: -> { returned_at.present? }

  private

  def mark_book_as_unavailable
    book.update(available: false)
  end

  def mark_book_as_available
    book.update(available: true)
  end
end
