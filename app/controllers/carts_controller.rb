class CartsController < ApplicationController

  def create
    id = params[:course_id].to_s
    @course = Course.find(id.to_i)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:success] = "#{@course.title} added to cart"

<<<<<<< HEAD
    redirect_to root_path
=======
    @cart.add_course(course.id)
    session[:cart] = @cart.content

    flash[:success] = "#{course.title} added to cart"
    # this redirect keeps user on course show page instead of home page after readding course
    redirect_back(fallback_location: root_path)
>>>>>>> 0cb900d0a67bf80a13812539d46bab1963384770
  end

  def show
    @cart = Cart.new(session[:cart])
    @courses = @cart.find_by_course_id
  end

<<<<<<< HEAD
=======
  def destroy
    id = params[:course_id].to_s
    @course = Course.find(id.to_i)
    session[:cart].delete(id)
    flash[:success] = "Successfully removed #{view_context.link_to @course.title, category_course_path(category_id: @course.category, id: @course.id)} from your cart."

    redirect_to cart_path
  end

>>>>>>> 0cb900d0a67bf80a13812539d46bab1963384770
end
