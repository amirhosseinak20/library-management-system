class LandingController < ApplicationController
  def index
    @books = Book.order('created_at desc').limit(4)
    @authors = User.joins(:role).where(roles: { name: 'author' }).order('updated_at desc').limit(4)
  end
end
