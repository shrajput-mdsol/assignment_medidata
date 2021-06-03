module ApplicationHelper
  def date_convert(date)
    if date.nil?
      ""
    else
      Rails.logger.info "DATE>>>>#{date}"
      Rails.logger.info "DATE CONVERTED>>>>#{date.strftime("%m/%d/%Y")}"
      date.strftime("%m/%d/%Y")
    end
  end
end
