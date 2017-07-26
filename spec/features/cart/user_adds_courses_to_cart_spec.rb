require 'rails_helper'

RSpec.feature "user visits index page" do
  before(:each) do

  end

  context "and adds course to cart" do
    scenario "and sees 'course added to cart!'" do

      visit root_path
      expect(page).to have_content
    end
  end
end
