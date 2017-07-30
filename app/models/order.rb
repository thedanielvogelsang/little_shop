class Order < ApplicationRecord
  belongs_to :user

  enum role: %w(ordered paid cancelled completed)
end
