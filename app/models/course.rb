class Course < ApplicationRecord
  scope :active, -> { where(retired: nil) }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  belongs_to :category
  has_many :user_courses
  has_many :users, through: :user_courses

  def self.search(search)
    where("lower(title) LIKE lower(?)", "%#{search.strip}%")
  end
end
