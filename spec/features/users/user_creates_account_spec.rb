require 'rails_helper'

RSpec.feature 'New user creates account from homepage' do
  it 'with valid attributes' do
    user_attributes = { username: 'Username',
                        password: 'password',
                        first_name: 'Donna',
                        last_name: 'Clark',
                        email: 'donna@gmail.com' }

    visit('/')

    click_link('Login')

    click_link('Create Account')

    fill_in 'user[username]', with: user_attributes[:username]
    fill_in 'user[password]', with: user_attributes[:password]
    fill_in 'user[first_name]', with: user_attributes[:first_name]
    fill_in 'user[last_name]', with: user_attributes[:last_name]
    fill_in 'user[email]', with: user_attributes[:email]

    click_button 'Create Account'

    expect(User.last.first_name).to eq('Donna')
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{user_attributes[:username]}")
    expect(page).to_not have_content('Login')
    expect(page).to have_content('Logout')
  end
end
