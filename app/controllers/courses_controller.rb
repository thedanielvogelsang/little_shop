class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @cart = Cart.new(session[:cart])
  end
end
