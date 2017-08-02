class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email,
                        :first_name,
                        :last_name,
                        :street_address,
                        :city,
                        :state,
                        :zip_code
  validates :username, presence: true, uniqueness: true

  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :orders

  enum role: %w[default admin]
end
