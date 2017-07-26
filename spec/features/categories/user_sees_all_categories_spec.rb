require 'rails_helper'

describe "User sees all items for a single category" do
  scenario "a user sees all the courses under a category" do
    cateogry_1 = Category.create!(title: "Ruby on Rails")
    course_1   = Course.create!(title: "Dissecting Ruby on Rails 5",
                               description: "Learn what it takes to become a
                               Rails developer", price: 35.99,
                               image: "http://lorempixel.com/300/300",
                               category_id: cateogry_1.id)
    course_2   = Course.create!(title: "Professional Rails Code Along",
                               description: "Develop a real world Rails project
                               using TDD/BDD", price: 59.99,
                               image: "http://lorempixel.com/300/300",
                               category_id: cateogry_1.id)
    cateogry_2 = Category.create!(title: "Angular")
    course_3   = Course.create!(title: "Learn and Understand AngularJS",
                               description: "Master AngularJS and the Javascript
                              concepts behind it,", price: 25.99,
                               image: "http://lorempixel.com/300/300",
                               category_id: cateogry_2.id)
    course_4   = Course.create!(title: "Angular 4: Master Class for Beginners",
                              description: "Master Angular 4 (2+) and establish
                              yourself as a skilled front-end developer",
                              price: 59.99, image: "http://lorempixel.com/300/300",
                              category_id: cateogry_2.id)

    visit category_path(cateogry_1)

    expect(current_path).to eq("/categories/#{cateogry_1.id}")
    expect(page).to have_content("Ruby on Rails")
    expect(page).to have_content("Dissecting Ruby on Rails 5")
    expect(page).to have_content("Professional Rails Code Along")

    visit category_path(cateogry_2)

    expect(current_path).to eq("/categories/#{cateogry_2.id}")
    expect(page).to have_content("Angular")
    expect(page).to have_content("Learn and Understand AngularJS")
    expect(page).to have_content("Angular 4: Master Class for Beginners")
  end
end