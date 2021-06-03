class Subject < ApplicationRecord
  belongs_to :site

  validates :name, :screening_no, presence: true
  # validate :end_date_later_than_enrolled_date
  #
  # def end_date_later_than_enrolled_date
  #   error_msg = 'End date cannot be earlier than enrolled date'
  #   if end_date <= enrollment_date
  #   errors.add(:end_date, error_msg)
  #   end
  # end
end
