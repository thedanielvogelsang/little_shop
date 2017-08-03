class Admin::OrdersController < Admin::AdminController
  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = @order.user
  end

  def update
    order = Order.find(params[:id])
    if params[:status]
      order.update(status: params[:status])
      redirect_to admin_dashboard_path
    end
  end
end
