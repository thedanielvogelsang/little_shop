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

  def check_admin
    render file: 'public/404' unless current_admin
  end

  def set_navbar_categories
    @nav_bar_categories = Category.all
  end

  def current_user?
    if current_user.id != params[:user_id].to_i
      render file: "/public/404"
    end
  end
end
