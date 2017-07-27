class Category < ApplicationRecord
  has_many :courses
  validates_presence_of :title
end
