class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name,
                        :last_name,
                        :street_address,
                        :city,
                        :state,
                        :zip_code
  validates :username, presence: true, uniqueness: true

  has_many :orders

  enum role: %w[default admin]
end
