class SubjectMailer < ApplicationMailer

  def welcome_mail
    Rails.logger.info "Mail>>>"
    @subject = params[:subject]
    mail(to: @subject.email, subject: "Welcome to the trial #{@subject.name}")
  end

end
