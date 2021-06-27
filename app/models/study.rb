class Study < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :subjects, through: :sites

  #Model Level Validations
  validates :title, uniqueness: true
  validates :title, :therapeutic_area, :no_of_subjects, presence: true
  validates :title, length: {in: 6..20}
  validates :phase, numericality: {less_than_or_equal_to: 5}
end