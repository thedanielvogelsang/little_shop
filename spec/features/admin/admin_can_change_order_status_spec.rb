require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  before(:each) do
    @user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "can change order status" do
    ordered_order = create(:order, status: 0)
    paid_prder = create(:order, status: 1)
    cancelled_order = create(:order, status: 2)
    completed_order = create(:order, status: 3)

    visit 'admin/dashboard'

    click_button 'mark as paid'
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
end
