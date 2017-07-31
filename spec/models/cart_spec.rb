require 'rails_helper'

RSpec.describe Cart, type: :model do
  before :each do
    @course1 = create(:course)
    @course2 = create(:course)
    @cart = Cart.new("#{@course1.id}" => 2, "#{@course2.id}" => 3)
  end

  describe '#total_price' do
    it 'can calculate the total number of courses it holds' do
      expect(@cart.total_price).to eq(250.00)
    end
  end

  describe '#find_by_course_id' do
    it 'can find by course id' do
      expect(@cart.find_by_course_id).to eq([@course1, @course2])
    end
  end

  describe "#add_course" do
    it "can increase quantity of an item in a cart" do
      expect(@cart.add_course(@course2.id)).to eq(4)
    end
  end

  describe "#subtract_course(id)" do
    it "can reduce item in cart" do
      expect(@cart.subtract_course(@course1.id)).to eq(1)
    end

    it "can delete a single item cart when user pressed reduce item" do
      expect(@cart.subtract_course(@course1.id)).to eq(1)
      expect(@cart.content[@course1.id.to_s]).to eq(nil)
    end
  end
end
