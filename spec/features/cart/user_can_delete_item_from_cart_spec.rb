require 'rails_helper'

RSpec.feature "user visits cart" do
  before(:each) do
    @course1 = create(:course, id: 1)
    @course2 = create(:course, id: 2)
    @cart = Cart.new({"1" => 2, "2" => 3})
  end

  scenario "can delete course from cart and link back to item" do
    visit root_path
    click_button "Add to Cart", match: :first

    visit cart_path(@cart)
    click_button "Remove", match: :first

    expect(current_path).to eq("/cart")
    expect(page).to have_css("div.alert")
    expect(page).to have_content("Successfully removed #{@course1.title} from your cart.")
    expect(page).to have_link("#{@course1.title}")
    expect(page).to_not have_content("#{@course1.description}")

    click_link "#{@course1.title}"

    expect(current_path).to eq("/categories/1/courses/#{@course1.id}")
  end
end
