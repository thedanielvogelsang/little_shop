class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :courses
  validates_presence_of :title

  def self.search(search)
    where("lower(title) LIKE lower(?)", "%#{search.strip}%")
  end
end
