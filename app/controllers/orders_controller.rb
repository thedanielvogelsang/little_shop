class OrdersController < ApplicationController

  def show
    @order = Order.find(session[:order_id])
    @courses = @order.courses
  end

  def new
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.create(user: current_user)
    create_course_orders
    @order.save
    flash[:message] = "Order was successfully placed"
    redirect_to orders_path
  end

  private

  def create_course_orders
    session[:cart].each do |course, qty|
      @order.course_orders.new(course_id: course.to_i, quantity: qty)
    end
  end
end
