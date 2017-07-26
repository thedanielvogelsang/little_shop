# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed
  def self.run
    new.run
  end

  def run
    generate_users
    generate_courses
    generate_categories
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.unique.user_name,
        password: Faker::Internet.password,
        email: Faker::Internet.email,
        role: rand(0..2)
        )
      puts "User #{i}: #{user.first_name} - #{user.role} created!"
    end
  end

  def generate_categories
    10.times do |i|
    category = Category.create!(
      title: Faker::Commerce.department
      )
  end

  def generate_courses
    offsetable_amount = Category.count - 1
    50.times do |i|
      course = Course.create!(
        title: Faker::Company.profession,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200",
        #alternatively image_url: Faker::Internet.url
        price: Faker::Number.decimal(2),
        category_id:
        )
      puts "Course #{i}: #{course.title} created and has!"
    end
  end

  # def generate_categories
  #   offsetable_amount = Course.count - 1
  #   10.times do |i|
  #     course  = Course.offset(rand(0..offsetable_amount)).limit(1).first
  #     category = Category.create!(course_id: course.id)
  #     puts "Category #{i}: Category for #{course.title} created!"
  #   end
  # end

end

Seed.run
