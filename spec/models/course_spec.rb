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
end
