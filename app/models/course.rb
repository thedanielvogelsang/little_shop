class Course < ApplicationRecord
  scope :active, -> { where(retired: nil) }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :category

  has_many :user_courses
  has_many :users, through: :user_courses

  has_many :course_orders
  has_many :orders, through: :course_orders
end
