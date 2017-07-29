require 'rails_helper'

RSpec.feature "user goes to course index" do
  scenario "and sees all active courses" do
    category = Category.create(title: "CategoryTitle")
    course = Course.create(title: "Mathematics", price: 1245.00, description: "Advanced Computations", image: "http://image_source.com", category_id: category.id)
    course2 = Course.create(title: "Statistics", price: 1245.00, description: "Advanced Stats", image: "http://image_source.com", category_id: category.id)
    course3 = Course.create(title: "General Chemistry", price: 1245.00, description: "Physical Chem 101", image: "http://image_source.com", category_id: category.id)
    course4 = Course.create(title: "Mathematics2.0", price: 1245.00, description: "Advanced Maths", image: "http://image_source.com", category_id: category.id)
    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course2.title)
    expect(page).to have_content(course3.title)
    expect(page).to have_content(course4.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course2.description)
    expect(page).to have_content(course3.description)
    expect(page).to have_content(course4.description)
  end

  scenario "and cannot see retired courses" do
    category = Category.create(title: "CategoryTitle")
    course = Course.create(title: "Mathematics", price: 1245.00, description: "Advanced Computations", image: "http://image_source.com", category_id: category.id)
    course2 = Course.create(title: "Statistics", price: 1245.00, description: "Advanced Stats", image: "http://image_source.com", category_id: category.id)
    course3 = Course.create(title: "General Chemistry", price: 1245.00, description: "Physical Chem 101", image: "http://image_source.com", category_id: category.id)
    course4 = Course.create(title: "Mathematics2.0", price: 1245.00, description: "Advanced Maths", image: "http://image_source.com", category_id: category.id)
    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course2.title)
    expect(page).to have_content(course3.title)
    expect(page).to have_content(course4.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course2.description)
    expect(page).to have_content(course3.description)
    expect(page).to have_content(course4.description)
  end
end
