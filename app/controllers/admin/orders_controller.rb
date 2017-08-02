class Admin::OrdersController < Admin::AdminController
  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
  end
end
