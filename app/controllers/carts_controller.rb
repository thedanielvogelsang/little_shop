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

  def update
    course = Course.find(params[:course_id])
    if params[:increase]
      @cart.add_course(course.id)
    else
      @cart.subtract_course(course.id)
    end
    redirect_to cart_path
  end

  def destroy
    id = params[:course_id]
    @course = Course.find(id)
    session[:cart].delete(id.to_s)
    flash[:success] = "Successfully removed #{view_context.link_to @course.title, course_path(@course)} from your cart."

    redirect_to cart_path
  end
end
