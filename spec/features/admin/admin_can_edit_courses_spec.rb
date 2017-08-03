require 'rails_helper'

RSpec.feature "admins can edit existing courses" do
  scenario "it saves course with updated information" do
    admin = create(:user, role: 1, password: "password")
    @course_1 = create(:course, title: "History", description: "20th Century history")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_courses_path
    expect(page).to have_content("History")

    click_link("Edit")
    expect(current_path).to eq(edit_admin_course_path(@course_1))
    expect(find_field('Title').value).to eq 'History'
    expect(find_field('Description').value).to eq "20th Century history"
    expect(find_field('Price').value).to eq '50.0'

    fill_in'course[title]', with: "Dance"
    fill_in'course[description]', with: "21st century dance"
    fill_in'course[price]', with: "100.0"

    click_button("Edit Course")
    expect(current_path).to eq(course_path(@course_1))
    expect(page).to have_content("Dance")
    expect(page).to have_content("100.0")
    expect(page).to have_content("21st century dance")
    expect(page).to_not have_content("History")
  end
end
