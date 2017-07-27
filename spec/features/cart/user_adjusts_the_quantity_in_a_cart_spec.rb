require 'rails_helper'

RSpec.feature "user visits their cart" do
  before(:each) do
    @category = create(:category)
    @course = create(:course, category: @category)
  end

  context "and adds an additional item to their cart" do
    it "should see the item subtotal and total amount in the cart increase" do

      visit root_path

      click_button "Add to Cart"

      click_link "Cart"

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 1")


      click_button "Increase Quantity"
      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 2")


      expect(page).to have_content("Subtotal: 100.00")
      expect(page).to have_content("Cart Total: 100.0")
    end
  end
end



# As a visitor When I visit "/cart" Then I should see my item with a quantity of
# 1 And when I increase the quantity Then my current page should be '/cart' And
# that item's quantity should reflect the increase And the subtotal for that item
# should increase And the total for the cart should match that increase
