class StudiesController < ApplicationController
  def root
  end

  def index
    @studies = Study.all
  end

  def new
    Rails.logger.info "Inside New"
    @study = Study.new
  end

  def create
    #save study received via form into database
    @study = Study.new(study_params)
    if @study.save
      redirect_to studies_index_path
    else
      render :new
    end
  end

  private
  def study_params
    params.require(:study).permit(:title, :therapeutic_area, :phase, :status, :start_date)
  end

end

