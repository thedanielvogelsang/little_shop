require 'rails_helper'

RSpec.feature "user visits /orders and sees link to past orders" do
  context "link directs user to view each ordered item with quantity and subtotal" do
    it "sees link to each each item's show page and current status of order" do

      user = create(:user)
      course1 = create(:course)
      course2 = create(:course)
      cart = Cart.new({ course1.id.to_s => 2, course2.id.to_s => 3 })
      order = create(:order, user_id: user.id)
      course_order1 = create(:course_order,
                            order_id: order.id,
                            course_id: course1.id)
      course_order2 = create(:course_order,
                            order_id: order.id,
                            course_id: course2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      click_link "My Orders"

      expect(current_path).to eq("/orders")
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(course1.title)
      expect(page).to have_content(course2.title)
      expect(page).to have_content(course1.price)
      expect(page).to have_content(course2.price)
      expect(page).to have_content(5)
      expect(page).to have_link(course1.title, href: course_path(course1))
      expect(page).to have_link(course2.title, href: course_path(course2))

      expect(page).to have_content(order.status)
      expect(page).to have_content(course_order2.subtotal)
      expect(page).to have_content(order.format_order_date_time)
      expect(page).to have_content(order.total_price)

      order.update_attributes(status: 2)
      expect(order.updated_at).to_not eq(order.created_at)
      expect(page).to have_content(order.updated_at.strftime("%A %D %H:%M %p"))

      order.update_attributes(status: 3)
      expect(order.updated_at).to_not eq(order.created_at)
      expect(page).to have_content(order.updated_at.strftime("%A %D %H:%M %p"))
    end
  end
end
