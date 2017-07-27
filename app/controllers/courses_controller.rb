class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @cart = Cart.new(session[:cart])
  end

  def show
    id = params[:id].to_s
    @course = Course.find(id)
  end
end
