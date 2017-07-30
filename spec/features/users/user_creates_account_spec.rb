require 'rails_helper'

RSpec.feature 'User creates new account from homepage' do
  describe 'with valid attributes' do
    describe 'and when they click on login tab' do
      it 'they can see link for create account' do
        visit('/')
        click_link('Login')
        expect(current_path).to eq('/login')
        expect(page).to have_content('Create Account')
        click_link('Create Account')
        expect(current_path).to eq '/users/new'
      end
    end

    describe 'and when they click on create account tab' do
      it 'they can click create account' do
        user_attributes = { username: 'Username', password: 'password',
                            first_name: 'Donna', last_name: 'Clark', email: 'donna@gmail.com' }

        visit 'users/new'

        expect(page).to have_css('//form')

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
  end
end

# As a visitor When I visit "/"
# Then I should see a link for "Login"
# And when I click "Login"
# And I should be on the "/login" page
# And I should see a link to "Create Account"
# And when I click link "Create Account"

# And I fill in my desired credentials
# And I submit my information
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"
