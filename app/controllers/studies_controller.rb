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

  def edit
    @study = Study.find(params[:id])
  end

  def update
    @study = Study.find(params[:id])
    if @study.update(study_params)
      redirect_to studies_index_path
    else
      render :edit
    end
  end

  def destroy
    @study = Study.find(params[:id])
    # #destroy subjects associated to each site
    # @study.sites.each do |site|
    #   site.subjects.destroy
    # end
    #
    # #destroy sites associated to study
    # @study.sites.destroy
    #destroy study
    if @study.destroy
      redirect_to studies_index_path
    else
      render plain: 'cant be deleted'
    end
  end

  def study_params
    params.require(:study).permit(:title, :therapeutic_area, :phase, :status, :start_date)
  end

end

