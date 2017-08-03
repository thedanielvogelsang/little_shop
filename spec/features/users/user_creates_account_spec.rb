require 'rails_helper'

RSpec.feature 'New user creates account from homepage' do
  it 'with valid attributes' do
    user_attributes = build(:user)

    visit('/')
    click_link('Login')
    click_link('Create Account')

    fill_in 'user[username]', with: user_attributes[:username]
    fill_in 'user[password]', with: user_attributes[:password_digest]
    fill_in 'user[first_name]', with: user_attributes[:first_name]
    fill_in 'user[last_name]', with: user_attributes[:last_name]
    fill_in 'user[street_address]', with: user_attributes[:street_address]
    fill_in 'user[unit_number]', with: user_attributes[:unit_number]
    fill_in 'user[city]', with: user_attributes[:city]
    fill_in 'user[state]', with: user_attributes[:state]
    fill_in 'user[zip_code]', with: user_attributes[:zip_code]

    click_button 'Create Account'

    expect(User.last.first_name).to eq(user_attributes.first_name)
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{user_attributes[:username]}")
    expect(page).to_not have_content('Login')
    expect(page).to have_content('Logout')
  end
end
