class Order < ApplicationRecord
  has_many :users
  has_many :course_orders
  has_many :courses, through: :course_orders

  validates_presence_of :user_id, :status

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    CourseOrder.where(order_id: self.id).map(&:subtotal).sum
  end

  def format_order_date_time
    created_at.strftime("%A %D %H:%M %p")
  end

end
