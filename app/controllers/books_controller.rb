class BooksController < ApplicationController
  before_action :can_update?, only: [:update]

  def index
    @items_count = 12
    @count = Book.all.count / @items_count.to_f
    @page = (params[:page] || 1).to_i
    @books = Book.order(params[:order_by] || 'created_at desc').limit(@items_count).offset((@page - 1) * @items_count)
    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
    @book = Book.find(params[:id])
    @borrow = @current_user.borrows.joins(:book).where(books: { id: @book.id }, return_date: nil)[0]
    @can_borrow = @current_user.can_borrow_book? && @current_user.borrows.where(return_date: nil).length < 2 && @borrow.nil?
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(@book, notice: 'User created')
    else
      render action: 'new', notice: 'There was a problem when editing book'
    end
  end

  def new
    @languages = Book.select(:language).map(&:language).uniq
    @genres = Book.select(:genre).map(&:genre).flatten.uniq
    @publishers = Publisher.select(:name, :id)
    if @current_user.is_an_author?
      @authors = [{ name: "#{@current_user.first_name} #{@current_user.last_name}", id: @current_user.id }]
    else
      @authors = User.joins(:role).where(roles: { name: 'author' }).map { |a| { name: "#{a.first_name} #{a.last_name}", id: a.id } }
    end
    puts @authors
  end

  def edit
    @languages = Book.select(:language).map(&:language).uniq
    @genres = Book.select(:genre).map(&:genre).flatten.uniq
    @publishers = Publisher.select(:name, :id)
    if @current_user.is_an_author?
      @authors = [{ name: "#{@current_user.first_name} #{@current_user.last_name}", id: @current_user.id }]
    else
      @authors = User.select(:first_name, :last_name, :id).where(role: 'author').map { |a| { name: "#{a.first_name} #{a.last_name}", id: a.id } }
    end
  end

  def update
    puts book_params
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

  def can_update?
    @current_user.author?(params[:id])
  end
  helper_method :can_update?

  def book_params
    p = params.require(:book).permit(:title, :isbn, :publication_date, :pages, :publisher_id, :genre, :language, :front_cover, :back_cover, :sample)
    p[:genre] = p[:genre].split(",") if p[:genre].instance_of? String
    p
  end
end
