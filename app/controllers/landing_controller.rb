class LandingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :init_user

  def index
    @books = Book.order('created_at desc').limit(4)
    @authors = User.joins(:role).where(roles: { name: 'author' }).order('updated_at desc').limit(4)
  end

  def init_user
    @current_user = current_user || User.new
  end
end
