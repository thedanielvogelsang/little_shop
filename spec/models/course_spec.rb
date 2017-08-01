require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it 'can only be created with all required attributes' do
      category = create(:category)
      valid_course = create(:course, category: category)
      invalid_course = build(:course, title: nil)

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
        user = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        course = create(:course)
        user_course = create(:user_course, user: user, course: course)
        user_course1 = create(:user_course, user: user2, course: course)

        expect(course.users).to_not include(user3)
        expect(course.users).to include(user)
        expect(course.users).to include(user2)
      end
    end
  end
end
