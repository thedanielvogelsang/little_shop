require 'rails_helper'

RSpec.describe CourseOrder, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:course_id) }
    it { is_expected.to validate_presence_of(:order_id) }
  end
end
