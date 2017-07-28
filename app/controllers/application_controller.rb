class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :set_navbar_categories


  def set_navbar_categories
    @nav_bar_categories = Category.all
  end

end
