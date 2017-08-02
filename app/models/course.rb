class Course < ApplicationRecord
  scope :active, -> { where(retired: nil) }

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 1 }
  validates :image, presence: true

  belongs_to :category

  has_many :user_courses
  has_many :users, through: :user_courses

  has_many :course_orders
  has_many :orders, through: :course_orders

  enum status: %w[active inactive]

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://robohash./mike"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
