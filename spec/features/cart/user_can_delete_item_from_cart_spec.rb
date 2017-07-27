require 'rails_helper'

RSpec.feature "user visits cart" do
  before(:each) do
    @course1 = create(:course, id: 1)
    @course2 = create(:course, id: 2)
    @cart = Cart.new({"1" => 2, "2" => 3})
  end

  scenario "can delete course from cart and link back to item" do
    visit cart_path(@cart)
    click_link "Remove", match: :first

    expect(current_path).to be("/cart")
    expect(page).to have_css('div.alert alert-success')
    expect(page).to have_content("Successfully removed #{@course1.title} from your cart.")
    expect(page).to have_link("#{@course1.title}")
    expect(page).to_not have_content("#{@course1.description}")

    click_link "#{@course1.title}"

    expect(current_path).to be("courses/#{@course1.id}")
  end
end
