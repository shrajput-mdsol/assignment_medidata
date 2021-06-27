class TrialProgressController < ApplicationController
  def progress
    @study = Study.new
    @happy_percentage = 0
  end

  def show_progress
    @study = Study.find(params[:study_id])
    @subject_count_at_sites = 0
    @study.sites.each { |site| @subject_count_at_sites += site.no_of_subjects }
    @status = ''
    if @subject_count_at_sites < @study.no_of_subjects
      @status = 'Not Started'
    elsif Subject.all.pluck(:rating).include? nil
      @status = 'In Progress'
    else
      @status = 'Completed'
    end
    @happy_percentage = ((@study.subjects.pluck(:rating).count('Happy').to_f) / @study.no_of_subjects.to_f) * 100
    render :progress
  end

  def mark_complete
    Study.find(params[:format]).subjects.all.update(active: false)
    flash.notice = "#{Study.find(params[:format]).subjects.all.size} Subjects is deactivated"
  end

  def show_status
  end
end