class Site < ApplicationRecord
  belongs_to :study

  validates :name, presence: true
  validates :no_of_subjects, numericality: true
  #validate :end_date_greater_than_start_date

  # def end_date_greater_than_start_date
  #   binding.pry
  #   error_msg = "site closing date cannot be earlier than site open date"
  #   errors.add(:site_close_date, error_msg) if :site_close_date < :site_open_date
  # end
end
