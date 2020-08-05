class BorrowsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @book = Book.find(params[:book_id])
    @user = current_user
    @borrow = Borrow.new({ user_id: @user.id, book_id: params[:book_id], borrow_date: Date.today })

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to @book, notice: 'Book borrowed successfully.' }
      else
        format.html { redirect_to @book, notice: 'There was a problem when registering borrow', error: @book.errors }
      end
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  protected

  def borrow_params
    params.require(:borrow).permit(:book_id)
  end
end
