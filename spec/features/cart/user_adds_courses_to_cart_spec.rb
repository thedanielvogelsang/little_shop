require 'rails_helper'

RSpec.feature "user visits index page" do
  before(:each) do
    category = create(:category)
    course = create(:course, category_id: category.id)
  end

  context "and adds course to cart" do
    scenario "and sees 'course added to cart!'" do

      visit root_path
      expect(page).to have_content
    end
  end
end
