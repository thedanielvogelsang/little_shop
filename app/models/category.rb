class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :courses
  validates_presence_of :title

  def search(search)
    @results = search.each do |term|
      where("title LIKE ?", "%#{term}%")
      Course.where(title: "#{term}")
    end
  end
end
