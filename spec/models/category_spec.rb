require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
