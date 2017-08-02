require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  before(:each) do
    @user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "can see all orders" do
    @orders =[
      create(:order, status: 0),
      create(:order, status: 3)
      ]

    visit 'admin/dashboard'

    @orders.each do |order|
      expect(page).to have_link(order.id)
    end
  end

  scenario "can see total number of orders for each status" do
    @orders =[
      create(:order, status: 0),
      create(:order, status: 0),
      create(:order, status: 1),
      create(:order, status: 2),
      create(:order, status: 2),
      create(:order, status: 2),
      create(:order, status: 3),
      create(:order, status: 3)
      ]
    visit 'admin/dashboard'

    expect(page).to have_content("Ordered: 2")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Cancelled: 3")
    expect(page).to have_content("Completed: 2")
  end

  scenario "can filter orders by status" do
    ordered_order = create(:order, status: 0)
    paid_prder = create(:order, status: 1)
    cancelled_order = create(:order, status: 2)
    completed_order = create(:order, status: 3)

    visit 'admin/dashboard'

    click_button 'ordered'
    expect(page).to have_link(ordered_order.id)

    click_button 'paid'
    expect(page).to have_link(paid_order.id)

    click_button 'cancelled'
    expect(page).to have_link(cancelled_order.id)

    click_button 'completed'
    expect(page).to have_link(completed_order.id)
    expect(page).to_not have_link(paid_order.id)
    expect(page).to_not have_link(cancelled_order.id)
    expect(page).to_not have_link(ordered_order.id)
  end
  # And I have links to transition between statuses
  # I can click on "cancel" on individual orders which are "paid" or "ordered"
  # I can click on "mark as paid" on orders that are "ordered"
  # I can click on "mark as completed" on orders that are "paid"
end
