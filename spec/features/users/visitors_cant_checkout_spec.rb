# As a visitor when I have items in my cart And when I visit "/cart" I should not see an option to "Checkout" I should see an option to "Login or Create Account to Checkout" After I create an account And I visit "/cart Then I should see all of the data that was there when I was not logged in"
require 'rails_helper'


RSpec.feature "visitor adds items to cart and attempts to checkout" do
  before(:each) do
    @item = create(:course)
  end

  context "and attempts to checkout" do
    scenario "but sees no checkout button but only a signup" do
      visit ("/")
      expect(page).to have_content(@item.title)
      2.times do
        click_on("Add to Cart")
      end
      visit("/cart")
      expect(page).to have_content(@item.title)
      expect(page).to have_content("Quantity: 2")
      expect(page).to_not have_button("Checkout")
      expect(page).to have_content("Login or Create Account to Checkout")
    end
  end
  context "and, after creating a user account" do
    scenario "sees all previous session items ready to be checked out" do
      visit ("/")
      expect(page).to have_content(@item.title)
      expect(page).to have_button("Add to Cart")
      2.times do
        click_on("Add to Cart")
      end
      visit("/cart")
      expect(page).to_not have_button("Checkout")
      within(".checkout-or-login-links") do
        click_on("Create Account")
      end

      fill_in "user[first_name]", with: "Dan"
      fill_in "user[last_name]", with: "Vog"
      fill_in "user[username]", with: "DVOG"
      fill_in "user[password]", with: "password"
      fill_in "user[email]", with: "Dan@gmail.com"
      within("//form") do
        click_on "Create Account"
      end
      visit("/cart")
      expect(page).to have_content(@item.title)
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_button("Checkout")
    end
  end
end
