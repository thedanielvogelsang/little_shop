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
    generate_courses

  end

  def generate_users
    50.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.unique.user_name,
        password: Faker::Internet.password,
        email: Faker::Internet.email,
        role: 'admin')

      puts "User #{i}: #{user.first_name} - #{user.role} created!"
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

  def generate_courses
    50.times do |i|
      category_id = rand(1..10)
      binding.pry if Category.find(category_id).nil?
      course = Course.create!(
        title: Faker::Company.profession,
        description: Faker::Lorem.paragraph,
        image: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200",
        #alternatively image_url: Faker::Internet.url
        price: Faker::Number.decimal(2),
        category_id: category_id
        )
      puts "Course #{i}: #{course.title} created and has!"
    end
  end
end

Seed.run
