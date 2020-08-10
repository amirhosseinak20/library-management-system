class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.order('created_at desc').limit(4)
    @authors = User.joins(:role).where(roles: { name: 'author' }).order('updated_at desc').limit(4)
  end
end
