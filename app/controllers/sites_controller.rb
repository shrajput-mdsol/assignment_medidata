class SitesController < ApplicationController
  def index
    @sites = ''
  end

  def show
    @sites = Site.where(study_id: params[:study_id])
    render :index
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_index_path
    else
      render :new
    end
    #site = Site.new(params[:site])
  end

  private

  def site_params
    params.require(:site).permit(:name, :no_of_subjects, :site_open_date, :site_close_date, :screen_failure_date,
                                 :address, :study_id)
  end
end
