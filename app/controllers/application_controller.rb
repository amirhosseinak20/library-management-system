class ApplicationController < ActionController::Base

  # layout
  layout :resolve_layout

  # auth
  protect_from_forgery prepend: true
  # before_action :authenticate_user!

  protected

  def resolve_layout
    if current_user
      'auth'
    else
      'guest'
    end
  end
end
