class AwarenessTip < ApplicationRecord
  belongs_to :appliance

  # Enum for hazard types in Thailand
  enum :hazard_type, {
    limescale: 0,
    moisture_mold: 1,
    gecko_pest: 2,
    electrical_surge: 3
  }

  validates :title, :actionable_mitigation, presence: true
end