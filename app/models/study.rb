class Study < ApplicationRecord
  has_many :sites, dependent: :destroy

  #Model Level Validations
  validates :title, :therapeutic_area, presence: true
  validates :title, length: {in: 6..20}
  validates :phase, numericality: {less_than_or_equal_to: 5}
end