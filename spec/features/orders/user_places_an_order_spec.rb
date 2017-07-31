require 'rails_helper'

RSpec.feature "Authenticated user clicks checkout" do
  describe "it places an order" do
    it "sees confirmation message" do

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    @course1 = create(:course)
    # @course2 = create(:course)
    # @cart = Cart.new({ @course1.id.to_s => 2, @course2.id.to_s => 3 })
    # click_link "Cart"
    # expect(current_path).to eq(cart_path(cart: @cart.content))

    visit root_path
    expect(page).to have_content("Course Details")

    click_button "Add to Cart"
    expect(page).to have_content("#{@course1.title} added to cart")

    click_link "Cart"
    expect(current_path).to eq("/cart")

    expect(page).to have_content(@course1.description)
    expect(page).to have_content(@course1.price)
    expect(page).to have_xpath("//img[contains(@src,'#{@course1.image}')]")

    click_button "Checkout"
    expect(current_path).to eq(orders_path)
    expect(user.orders.first).to be_truthy
    expect(page).to have_content("Order was successfully placed")

    end
  end
end
