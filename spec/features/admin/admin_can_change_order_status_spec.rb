require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  before(:each) do
    @user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "can change order status" do
    ordered_order = create(:order, status: 0)
    paid_order = create(:order, status: 1)

    visit 'admin/dashboard'
    click_button 'mark as paid'
    click_button 'mark as completed'

    expect(ordered_order.status).to eq(1)
    expect(paid_order.status).to eq(3)
  end
end
