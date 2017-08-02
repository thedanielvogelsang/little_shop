require 'rails_helper'

RSpec.feature 'admin visits order page' do
  before(:each) do
    @admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @user = create(:user)
    @order = create(:order)
    @course_order = create(:course_order, order: @order)
  end

  scenario "can see correct information" do
    visit admin_order_path(@order)

    expect(page).to have_content(@order.user.first_name)
    expect(page).to have_content(@order.user.last_name)
    expect(page).to have_content(@order.user.address)
    expect(page).to have_content(@order.created_at)
    byebug
    @order.courses.each do |course|
      expect(page).to have_link(course.title)
      expect(page).to have_content(course.price)
    end
  end
end

#
# And I can see, for each item on the order:
#
# Quantity in this order.
#
# Line item subtotal.
# And I can see the total for the order.
# And I can see the status for the order.
