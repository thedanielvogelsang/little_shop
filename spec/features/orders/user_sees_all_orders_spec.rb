require 'rails_helper'

RSpec.feature "Authenticated user visits /orders" do
  scenario "as an authorized user" do
    it "and sees only the orders for that user" do

      # user_1 = FactoryGirl.build(:user, :with_orders)
      # user_2 = FactoryGirl.build(:user, :with_orders)
      user_1 = User.create(username: "Gigi", password: "password")
      user_2 = User.create(username: "Ben", password: "password")
      order_1 = create(:order, status: "completed")
      order_2 = create(:order, status: "cancelled")
      order_3 = create(:order, status: "paid")
      user_1.orders = order_1, order_2
      user_2.orders << order_3

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit orders_path(user_id: user_1.id)

      expect(page).to have_content("My Orders")
      expect(page).to have_content("completed")
      expect(page).to_not have_content("paid")
    end
  end

  scenario "as an unauthorized user" do
    it "and sees error page 404" do

      user_1 = User.create(username: "Gigi", password: "password")
      user_2 = User.create(username: "Ben", password: "password")
      order_1 = create(:order, status: "completed")
      order_2 = create(:order, status: "cancelled")
      order_3 = create(:order, status: "paid")
      user_1.orders = order_1, order_2
      user_2.orders << order_3

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit orders_path(user_id: user_1.id)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
