require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  before(:each) do
    @user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "can change ordered and paid status" do
    order = create(:order, status: :ordered)
    visit 'admin/dashboard'

    click_link 'mark as paid'
    expect(order.reload.status).to eq('paid')

    click_link 'mark as completed'
    expect(order.reload.status).to eq('completed')
  end

  scenario "can cancel ordered order" do
    order = create(:order, status: :ordered)
    visit 'admin/dashboard'

    click_link 'cancel'
    expect(order.reload.status).to eq('cancelled')
  end

  scenario "can cancel paid order" do
    order = create(:order, status: :paid)
    visit 'admin/dashboard'

    click_link 'cancel'
    expect(order.reload.status).to eq('cancelled')
  end
end
