require 'rails_helper'

RSpec.feature 'unauthenticated user visits homepage' do
  it 'can login and see dashboard' do
    @user = create(:user, username: 'DVOG', password: 'password')

    visit('/')

    click_link('Login')

    fill_in 'session[username]', with: 'DVOG'
    fill_in 'session[password]', with: 'password'

    click_button 'Login'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content(@user.username)
    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)
    expect(page).to have_content(@user.street_address)
    expect(page).to have_content(@user.unit_number)
    expect(page).to have_content(@user.city)
    expect(page).to have_content(@user.state)
    expect(page).to have_content(@user.zip_code)
    expect(page).to have_content("Logged in as #{@user.username}")
  end
end
