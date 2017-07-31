class CourseOrder < ApplicationRecord
  belongs_to :course
  belongs_to :order

  #validates_presence_of :course_id, :order_id
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_create :set_subtotal

  def set_subtotal
    unless quantity.zero?
      update_attribute(:subtotal, course.price * quantity)
    end
  end
end
