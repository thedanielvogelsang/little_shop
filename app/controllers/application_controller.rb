class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_navbar_categories
  helper_method :current_user

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def set_navbar_categories
    @nav_bar_categories = Category.all
  end
end
