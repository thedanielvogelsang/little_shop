require 'rails_helper'

RSpec.feature "user visits index page" do
  before(:each) do
    @category = create(:category)
    @course = create(:course, category: @category)
  end

  context "and adds course to cart" do
    scenario "and sees course added to cart!'" do

      visit root_path
      expect(page).to have_content("MyCourse")
      expect(page).to have_content("Course Details")

      click_button "Add to Cart"
      expect(page).to have_content("#{@course.title} added to cart")

      click_link "Cart"
      expect(current_path).to eq("/cart")
      expect(page).to have_content(@course.title)
      expect(page).to have_content(@course.description)
      expect(page).to have_content(@course.price)
      #expect(page).to have_xpath("//img[contains(@src,#{@course.image})]")
      #expect(page).to have_selector("//img", :src =>"#{@course.image}")

      expect(page).to have_content(50)

    end
  end
end
