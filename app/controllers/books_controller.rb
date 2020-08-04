class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.order('created_at desc').limit(12)
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  # method get
  def search
    @q_books = Book.where("title like ?", "%#{params[:q]}%").limit(5)
    render json: {
        items: @q_books.map { |item| {
            title: item.title,
            url: book_path(item.id),
            authors: item.authors.map { |elem| "#{elem.first_name} #{elem.last_name}"} .join(", ")
        } }
    }
  end
end
