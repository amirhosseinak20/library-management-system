class BooksController < ApplicationController
  # constants
  ITEMS_PER_PAGE = 12

  # helpers
  include ApplicationHelper

  # before actions
  before_action :can_create_books?, only: [:new, :create]
  before_action :can_update_book?, only: [:edit, :update]
  before_action :crud_params, only: [:new, :create, :edit, :update]

  def index
    @pagination = {
      items_per_page: ITEMS_PER_PAGE,
      items_count: Book.all.count,
      current_page: numeric?(params[:page]) && params[:page].to_i.positive? ? params[:page].to_i : 1,
      last_page: (Book.all.count / ITEMS_PER_PAGE.to_f).ceil,
      order: params[:order_by] || 'created_at-desc'
    }
    @books = Book.order(@pagination[:order].gsub("-", " "))
                 .limit(@pagination[:items_per_page])
                 .offset((@pagination[:current_page] - 1) * @pagination[:items_per_page])
    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
    @book = Book.find(params[:id])
    @borrow = @book.borrows.where(user_id: current_user.id, return_date: nil)[0] if authenticated?
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    authors = params[:book][:authors_ids].map { |id| User.find(id) }
    if @book.save
      @book.authors << authors
      @book.save
      redirect_to(@book, notice: 'Book created')
    else
      render :new, notice: 'There was a problem when editing book', error: @book.errors
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit, notice: 'There was a problem when editing book', error: @book.errors }
      end
    end
  end

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

  protected

  def book_params
    params[:book][:genre] = params[:book][:genre].split(",") if params[:book][:genre].instance_of? String
    if params[:book][:authors_ids].instance_of? String
      params[:book][:authors_ids] = params[:book][:authors_ids].split(",")
    end
    params.require(:book).permit(
      :front_cover,
      :back_cover,
      :sample,
      :title,
      :isbn,
      :publication_date,
      :pages,
      :publisher_id,
      :language,
      genre: []
    )
  end

  def crud_params
    @languages = Book.select(:language).map(&:language).uniq
    @genres = Book.select(:genre).map(&:genre).flatten.uniq
    @publishers = Publisher.select(:name, :id)
    @authors = User.joins(:role).where(roles: { name: 'author' }).map do |a|
      { name: "#{a.first_name} #{a.last_name}", id: a.id }
    end
    @authors.select! { |author| author[:id] == current_user.id } if current_user.is_an_author?
  end

  def can_create_books?
    redirect_to request.referer || request.base_url unless current_user&.can_create_books?
  end

  def can_update_book?
    redirect_url = request.referer || request.base_url
    redirect_to redirect_url unless numeric?(params[:id]) && current_user&.can_update_book?(params[:id])
  end
end
