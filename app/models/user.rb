class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email,
                        :password,
                        :first_name,
                        :last_name
  validates :username, presence: true, uniqueness: true
  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :orders

  enum role: %w(default admin)
end
