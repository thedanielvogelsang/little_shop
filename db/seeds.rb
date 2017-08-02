require 'date'

User.destroy_all
Course.destroy_all
Category.destroy_all

class Seed
  def self.run
    new.run
  end

  def run
    generate_users
    generate_categories
    generate_active_courses
    generate_retired_courses
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.unique.user_name,
        password: Faker::Internet.password,
        street_address: Faker::Address.street_address,
        unit_number: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        role: rand(0..1)
      )
      if user.role == 'admin'
        puts "User #{i}: #{user.username} - #{user.password} created!"
      else
        puts "User #{i}: #{user.first_name} - #{user.role} created!"
      end
    end
  end

  def generate_categories
    10.times do |i|
      category = Category.create!(
        title: Faker::Commerce.department
      )
      puts "Category #{i}: #{category.title}!"
    end
  end

  def generate_active_courses
    50.times do |i|
      course = Course.create!(
        title: Faker::Company.profession,
        description: Faker::Lorem.paragraph,
        image: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200",
        price: Faker::Number.decimal(2),
        category_id: rand(1..10)
      )
      puts "Course #{i}: #{course.title} created with id:#{course.id}!"
    end
  end

  def generate_retired_courses
    5.times do |i|
      course = Course.create!(
        title: Faker::Company.profession,
        description: Faker::Lorem.paragraph,
        image: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200",
        price: Faker::Number.decimal(2),
        category_id: rand(1..10),
        retired: DateTime.now
      )
      puts "Retired course #{i}: #{course.title} created with id: #{course.id}!"
    end
  end
end

Seed.run
