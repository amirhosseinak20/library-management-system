module BooksHelper
  def book_is_borrowed?(book)
    book.borrows.where(user_id: current_user.id, return_date: nil).first
  end
end
