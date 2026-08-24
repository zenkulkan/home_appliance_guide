class Appliance < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :awareness_tips, dependent: :destroy

  # 1. The Tier System (Enum)
  # By assigning explicit integers, 3 is naturally "greater" than 0.
  # This makes ordering by quality_tier extremely fast in SQLite.
  enum :quality_tier, {
    d_tier: 0,
    c_tier: 1,
    b_tier: 2,
    a_tier: 3,
    s_tier: 4
  }

  # 2. Validations
  validates :name, :price_thb, presence: true
  validates :price_thb, numericality: { greater_than_or_equal_to: 0 }

  # 3. Budget Scopes (For instant filtering)
  scope :budget_under_10k,  -> { where(price_thb: ..9_999.99) }
  scope :budget_10k_to_25k, -> { where(price_thb: 10_000..24_999.99) }
  scope :budget_25k_to_50k, -> { where(price_thb: 25_000..49_999.99) }
  scope :budget_above_50k,  -> { where(price_thb: 50_000..) }

  # 4. The Sorting Scope (Best tier first, then lowest price)
  scope :top_rated, -> { order(quality_tier: :desc, price_thb: :asc) }

  # Helper method for UI display (e.g. "S-Tier")
  def display_tier
    case quality_tier
    when "s_tier" then "S-Tier"
    when "a_tier" then "A-Tier"
    when "b_tier" then "B-Tier"
    when "c_tier" then "C-Tier"
    when "d_tier" then "D-Tier"
    else "Unrated"
    end
  end
end