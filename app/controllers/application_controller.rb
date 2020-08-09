class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :init_user

  protected

  def init_user
    @current_user = current_user || User.new
  end
end
