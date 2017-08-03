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
    generate_inactive_courses
    generate_orders
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
        title: Faker::Commerce.unique.department
      )
      puts "Category #{i}: #{category.title}, #{category.id}!"
    end
  end

  def generate_active_courses
    25.times do |i|
      course = Course.create!(
        title: Faker::Educator.unique.course,
        description: Faker::Educator.university,
        image: "https://unsplash.it/400/300?image=0",
        price: Faker::Number.decimal(2),
        category_id: rand(1...10)
      )
      puts "Course #{i}: #{course.title} created with id:#{course.id}!"
    end
  end

  def generate_inactive_courses
    5.times do |i|
      course = Course.create!(
        title: Faker::Educator.course,
        description: Faker::Educator.university,
        image: "https://unsplash.it/400/300?image=0",
        price: Faker::Number.decimal(2),
        category_id: rand(1..10),
        status: 1
      )
      puts "Retired course #{i}: #{course.title} created with id: #{course.id}!"
    end
  end

  def generate_orders
    25.times do |i|
      order = Order.create!(
      user_id: rand(1..50),
      status: rand(0..3)
      )
      3.times do
        order.course_orders.create(course_id: rand(1..50), quantity: rand(1...5))
      end
      if order.status == 'default'
        puts "Order #{i}: default order created with #{order.user} created with id: #{order.id}"
      elsif order.status == 'paid'
        puts "Order #{i}: paid order created with #{order.user} created with id: #{order.id}"
      elsif order.status == 'cancelled'
        puts "Order #{i}: cancelled order created with #{order.user} created with id: #{order.id}"
      else order.status == 'completed'
        puts "Order #{i}: completed order created with #{order.user} created with id: #{order.id}"
      end
    end
  end
end

Seed.run
