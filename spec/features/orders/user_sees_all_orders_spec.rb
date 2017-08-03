require 'rails_helper'

RSpec.feature "Authenticated user visits /orders" do
  xdescribe "as an authorized user" do
    it "and sees only the orders for that user" do

      @user_1 = User.create(username: "Sue", password: "0000")
      @user_2 = User.new(username: "Peter", password: "1111")
      @order_1 = Order.create(status: "completed")
      @order_2 = Order.create(status: "cancelled")
      order_3 = Order.create(status: "paid")
      @user_1.orders = @order_1, @order_2
      @user_2.orders << order_3

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit "/orders"

      expect(page).to have_content("My Orders")
      expect(page).to have_content("completed")
      expect(page).to_not have_content("paid")
    end
  end

  describe "as an authenticated user" do
    it "sees only orders that belong to them " do

      @user_1 = User.create(username: "Sue", password: "0000")
      @user_2 = User.new(username: "Peter", password: "1111")
      order_1 = Order.create(status: "completed")
      order_2 = Order.create(status: "cancelled")
      order_3 = Order.create(status: "paid")
      @user_1.orders = order_1, order_2

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)

      visit "/orders"

      expect(page).to have_content("You have no orders")
    end
  end
end
