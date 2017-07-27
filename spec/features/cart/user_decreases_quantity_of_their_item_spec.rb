require 'rails_helper'

RSpec.feature "user visits their cart" do
  before(:each) do
    @category = create(:category)
    @course = create(:course, category: @category)
  end

  context "and deduces an item from their cart" do
    it "should see the item subtotal and total amount in the cart change" do
      visit root_path

      click_button "Add to Cart"

      click_link "Cart"

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: 50.00")
      click_button "Decrease Quantity"
      expect(current_path).to eq("/cart")
      expect(page).to_not have_content("Quantity: 1")
      expect(page).to_not have_content("Subtotal: 50.00")

    end
  end
end
