class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :courses
  validates_presence_of :title

  def self.search(search_term)
    if search_term
      where('title LIKE ?', "%#{search_term}%")
    else
      order('id DESC')
    end
  end
end
