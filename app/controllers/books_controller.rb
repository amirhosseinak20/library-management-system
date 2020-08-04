class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    per_page = 12
    @count = Book.all.count / per_page
    @page = (params[:page] || 1).to_i
    @books = Book.order(params[:order_by] || 'created_at desc').limit(per_page).offset((@page - 1) * per_page)
  end

  def show; end

  def create; end

  def new; end

  def edit; end

  def show; end

  def update; end

  def destroy; end

  # method get
  def search
    @q_books = Book.where("title like ?", "%#{params[:q]}%").limit(5)
    render json: {
      items: @q_books.map do |item| 
               {
                 title: item.title,
                 url: book_path(item.id),
                 authors: item.authors.map { |elem| "#{elem.first_name} #{elem.last_name}" }.join(", ")
               }
             end               
    }
  end
end
