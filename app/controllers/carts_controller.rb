class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def create
    course = Course.find(params[:course_id])

    @cart.add_course(course.id)
    session[:cart] = @cart.content

    flash[:success] = "#{course.title} added to cart"
    redirect_to root_path
  end

  def show
    @courses = @cart.find_by_course_id
  end
end
