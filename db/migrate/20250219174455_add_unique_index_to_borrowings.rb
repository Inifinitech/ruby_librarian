class AddUniqueIndexToBorrowings < ActiveRecord::Migration[8.0]
  def change
    add_index :borrowings, [:book_id, :borrower_name], unique: true
  end
end
