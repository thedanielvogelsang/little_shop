require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe "associations" do
    it { is_expected.to have_many(:course_orders) }
    it { should have_many(:courses).through(:course_orders) }
  end
end
