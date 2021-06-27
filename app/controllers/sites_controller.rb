class SitesController < ApplicationController
  def index
    @study_id = ''
    @sites = ''
  end

  def show
    # @cities = City.where("country_id = ?", Country.first.id)
    @study_id = params[:study_id]
    @sites = Site.where(study_id: params[:study_id])
    render :index
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_index_path, notice: "Site added to Study: #{Study.find(params[:site][:study_id]).title}..."
    else
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to sites_index_path, notice: "Site #{@site.name} has been updated..."
    else
      render :edit
    end
  end

  def destroy
    @site = Site.find(params[:id])
    if @site.destroy
      redirect_to sites_index_path
    else
      render plain: 'cant de deleted'
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :no_of_subjects, :site_open_date, :site_close_date, :screen_failure_rate,
                                 :address, :study_id)
  end
end
