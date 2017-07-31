require 'rails_helper'

RSpec.describe Order, type: :model do

  before :each do
    user = User.create(username: "MakingOrders", password: "0000")
    @order = Order.create(user_id: user.id)
  end
    describe "associations" do
      it { is_expected.to belong_to(:user)}
      it { is_expected.to have_many(:course_orders) }
      it { should have_many(:courses).through(:course_orders) }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of(:status)}
    end
    describe "status enum value" do
      it "order has status ordered by default" do
        expect(@order.ordered?).to be_truthy
        expect(@order.status).to eq("ordered")
      end
    end
end
