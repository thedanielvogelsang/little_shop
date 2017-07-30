class Order < ApplicationRecord
  belongs_to :user
  validates_presence_of :status

  enum status: %w(ordered paid cancelled completed)
end
