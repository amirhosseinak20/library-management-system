class BorrowsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @book = Book.find(params[:book_id])
    @user = current_user
    @borrow = Borrow.new({user_id: @user.id, book_id: params[:book_id], borrow_date: Date.today})

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to request.referer || @book, notice: 'Book borrowed successfully.' }
      else
        format.html { redirect_to request.referer || @book, notice: 'There was a problem when registering borrow', error: @book.errors }
      end
    end
  end

  def update
    @borrow = Borrow.find(params[:id])
    @book = Book.find(params[:book_id])
    respond_to do |format|
      if @borrow.update(borrow_update_params)
        format.html { redirect_to request.referer || @book, notice: 'Book returned successfully.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  def edit
  end

  protected

  def borrow_params
    params.require(:borrow).permit(:book_id)
  end

  def borrow_update_params
    params.permit(:return_date)
  end
end
