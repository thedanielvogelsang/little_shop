class Course < ApplicationRecord
  validates :title, presence: true #, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 1 }

  belongs_to :category

  has_many :course_orders
  has_many :orders, through: :course_orders

  enum status: %w[active inactive]

  def self.search(search)
    where("lower(title) LIKE lower(?)", "%#{search.strip}%")
  end

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
      # where('name LIKE ?', "%#{search_term}%").limit(10)
      # where('name LIKE ?', "%#{search_term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
