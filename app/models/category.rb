class Category < ApplicationRecord
  has_many :appliances, dependent: :restrict_with_error

  validates :name, :slug, presence: true, uniqueness: true

  # Auto-generate slug if missing
  before_validation :generate_slug

  private
  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end