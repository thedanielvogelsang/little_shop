require 'rails_helper'

RSpec.describe Cart, type: :model do
  before :each do
    @course1 = create(:course)
    @course2 = create(:course)
    @cart = Cart.new({ @course1.id.to_s => 2, @course2.id.to_s => 3})
  end

  describe "#total_price" do
    it "can calculate the total number of courses it holds" do
      expect(@cart.total_price).to eq(250.00)
    end
  end

  describe "#find_by_course_id" do
    it "can find by course id" do
      expect(@cart.find_by_course_id).to eq([@course1, @course2])
    end
  end
end
