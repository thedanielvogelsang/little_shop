require 'rails_helper'

RSpec.describe UserCourse, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:course_id) }
  end
end
