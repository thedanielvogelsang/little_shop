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
    # this redirect keeps user on course show page instead of home page after readding course
    redirect_back(fallback_location: root_path)
end

  def show
    @courses = @cart.find_by_course_id
  end

  def add
    course = Course.find(params[:course_id])
    @cart.add_course(course.id)

    redirect_to cart_path
  end

  def destroy
    id = params[:course_id].to_s
    @course = Course.find(id.to_i)
    session[:cart].delete(id)
    flash[:success] = "Successfully removed #{view_context.link_to @course.title, category_course_path(category_id: @course.category, id: @course.id)} from your cart."

    redirect_to cart_path
  end
end
