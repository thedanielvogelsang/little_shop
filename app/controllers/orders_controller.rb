class OrdersController < ApplicationController

  def index
    current_user?
    @orders = current_user.orders
    # else
    #   render file: "/public/404"
    # end
  end
end
