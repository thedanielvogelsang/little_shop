class CartsController < ApplicationController

  def create
    id = params[:course_id].to_s
    @course = Course.find(id.to_i)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:success] = "#{@course.title} added to cart"

    redirect_to root_path
  end

  def show
    @cart = Cart.new(session[:cart])
    @courses = @cart.find_by_course_id
  end

  def destroy
    id = params[:course_id].to_s
    @course = Course.find(id.to_i)
    session[:cart].delete(id)
    flash[:success] = "Successfully removed #{@course.title} from your cart."
    redirect_to cart_path
  end

end
