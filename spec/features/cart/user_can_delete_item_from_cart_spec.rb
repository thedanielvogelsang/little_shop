require 'rails_helper'

RSpec.feature 'user visits cart' do
  scenario 'can delete course from cart and link back to item' do
    @course1 = create(:course)

    visit root_path
    click_on 'Add to Cart'
    click_on 'Add to Cart'

    visit cart_path
    click_on 'Remove'

    expect(current_path).to eq(cart_path)
    expect(page).to have_css('div.alert-success')
    expect(page).to have_content("Successfully removed #{@course1.title} from your cart.")
    expect(page).to have_link("#{@course1.title}")
    expect(page).to_not have_content("#{@course1.description}")

    click_link "#{@course1.title}"
    expect(current_path).to eq("/courses/#{@course1.id}")
  end
end
