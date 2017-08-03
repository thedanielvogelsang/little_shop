class Course < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 1 }

  belongs_to :category

  has_many :course_orders
  has_many :orders, through: :course_orders

  enum status: %w[active inactive]
  
  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
    else
      order('id DESC')
    end
  end
end
