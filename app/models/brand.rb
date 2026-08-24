class Brand < ApplicationRecord
  has_many :appliances, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  # Validate service rating from 1 to 5 stars
  validates :service_rating, inclusion: { in: 1..5 }, allow_nil: true
end