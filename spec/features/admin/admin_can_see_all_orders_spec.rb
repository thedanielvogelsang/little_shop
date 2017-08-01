require 'rails_helper'

RSpec.feature 'admin visits dashboard' do
  scenario "can see all orders" do
    order1 = create(:order, status: 0)
    order2 = create(:order, status: 1)
    order3 = create(:order, status: 2)
    order4 = create(:order, status: 3)
    order5 = create(:order, status: 3)

    visit 'admin/dashboard'

    expect(page).to have_content(["#{order1.id}", "#{order2.id}", "#{order3.id}",
                                 "#{order4.id}", "#{order5.id}"])
    expect(page).to have_link(["#{order1.id}", "#{order2.id}", "#{order3.id}",
                                  "#{order4.id}", "#{order5.id}"])
    # I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed"
    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
    # And I have links to transition between statuses
    #
    # I can click on "cancel" on individual orders which are "paid" or "ordered"
    # I can click on "mark as paid" on orders that are "ordered"
    # I can click on "mark as completed" on orders that are "paid"
  end
end
