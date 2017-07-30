require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it 'can only be created with all required attributes' do
      category = create(:category)
      valid_course = create(:course, category: category)
      invalid_course = Course.new(price: 1245.00, description: 'Advanced Computations', image: 'http://image_source.com', category: category)

      expect(valid_course.save).to be true
      expect(invalid_course.class).to be(Course)
      expect(invalid_course.save).to be false
    end
  end

  describe 'associations' do
    describe 'with new users' do
      it 'can call users' do
        user = create(:user)
        course = create(:course)
        user_course = create(:user_course, user: user, course: course)

        expect(course.users.last).to eq(user)
        expect(user.courses.last).to eq(course)
      end
    end
    describe 'with existing users' do
      it 'it calls only users associated with it' do
        category = Category.create(title: 'STEM')
        user = User.create(username: 'DVOG', password: 'password', email: '123@gmail.com', first_name: 'Daniel', last_name: 'Vogelsang')
        user2 = User.create(username: 'MVOG', password: 'password', email: '123@gmail.com', first_name: 'Daniel', last_name: 'Vogelsang')
        user3 = User.create(username: 'TVOG', password: 'password', email: '123@gmail.com', first_name: 'Daniel', last_name: 'Vogelsang')
        course = Course.create(title: 'Mathematics', price: 1245.00, description: 'Advanced Computations', image: 'http://image_source.com', category_id: category.id)

        course.users << user
        course.users << user2

        expect(course.users).to_not include(user3)
        expect(course.users).to include(user)
        expect(course.users).to include(user2)
      end
    end
    # it { is_expected.to have_many(:user_courses)}
    # it { should have_many(:users).through(:user_courses) }
  end
end
