require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    describe 'must have valid attributes' do
      it "can't be created without first or last name" do
        user1 = build(:user, first_name: nil)
        user2 = build(:user, last_name: nil)

        expect(user1.first_name).to eq(nil)
        expect(user2.last_name).to eq(nil)
        expect(user1.save).to be false
        expect(user2.save).to be false
      end
      it 'cannot have the same username' do
        user1 = User.create(username: 'DVOG', password: 'password', email: 'email@gmail.com', first_name: 'd', last_name: 'v')
        new_user = User.new(username: 'DVOG', password: 'password', email: 'email@gmail.com', first_name: 'd', last_name: 'v')
        expect(new_user.save).to be false
      end
    end
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'associations' do
    it { is_expected.to have_many(:user_courses) }
    it { should have_many(:courses).through(:user_courses) }
  end

  context 'enum role' do
    it 'can be created as an admin' do
      admin = User.create(username: 'DVOG', password: 'password', email: 'email@gmail.com', first_name: 'd', last_name: 'v', role: 1)
      expect(admin.admin?).to be_truthy
      expect(admin.role).to eq('admin')
    end
    it 'can be created as default user by default' do
      default = User.create(username: 'DVOG', password: 'password', email: 'email@gmail.com', first_name: 'd', last_name: 'v')
      expect(default.role).to eq('default')
      expect(default.default?).to be_truthy
    end
  end
end
