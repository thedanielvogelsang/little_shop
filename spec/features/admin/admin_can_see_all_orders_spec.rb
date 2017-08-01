require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  before(:each) do
    @user = create(:user, role: 1)
    @order1 = create(:order, status: 0)
    @order2 = create(:order, status: 1)
    @order3 = create(:order, status: 2)
    @order4 = create(:order, status: 3)
    @order5 = create(:order, status: 3)
  end

  scenario "can see all orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/dashboard'

    expect(page).to have_link(@order1.id)
    expect(page).to have_link(@order2.id)
    expect(page).to have_link(@order3.id)
    expect(page).to have_link(@order4.id)
    expect(page).to have_link(@order5.id)
  end

  scenario "can see total number of orders for each status" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/dashboard'

    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Completed: 2")
  end
  # I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
  # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
  # And I have links to transition between statuses
  #
  # I can click on "cancel" on individual orders which are "paid" or "ordered"
  # I can click on "mark as paid" on orders that are "ordered"
  # I can click on "mark as completed" on orders that are "paid"
end
