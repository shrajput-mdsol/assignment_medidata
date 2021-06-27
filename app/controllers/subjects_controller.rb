class SubjectsController < ApplicationController
  def index
    @site_id = ''
    get_study_site_for_select
    @subjects = ''
  end

  def show
    get_study_site_for_select
    @site_id = params[:site_id]
    @subjects = Subject.where(site_id: params[:site_id])
    render :index
  end

  def create
    #ForbiddenAttributesError.html
    # @subject = Subject.new(params[:subject])
    @subject = Subject.new(subject_params)
    # if @subject.invalid?
    #   render :new
    # else
    # if Subject.where(site_id: subject_params[:site_id]).size < Site.find(subject_params[:site_id]).no_of_subjects.to_i
    #    @subject.save
    #    redirect_to subjects_index_path, notice: "Subject have been added to Site: #{Site.find(params[:subject][:site_id]).name}..."
    # else
    #     redirect_to subjects_index_path, notice: "Subject cannot be added, maximum limit is reached"
    # end
    # end
    if @subject.invalid?
      render :new

    else

      #total no of subjects specified in study
      current_study = Study.find(Site.find(subject_params[:site_id]).study_id)
      study_sub_count = current_study.no_of_subjects
      Rails.logger.info "Study Sub Count>>>> #{study_sub_count}"

      #total no of subjects allocated to all the sites belonging to this study
      site_sub_count = 0
      current_site = Site.find(subject_params[:site_id])
      current_study.sites.each { |site| site_sub_count += site.no_of_subjects }
      Rails.logger.info "Site Sub Count>>>> #{site_sub_count}"

      if site_sub_count < study_sub_count
        @subject.save
        #Send the mail to subject
        SubjectMailer.with(subject: @subject).welcome_mail.deliver_later
        current_site.update(no_of_subjects: current_site.no_of_subjects + 1)
        redirect_to subjects_index_path, notice: "Subject have been added to Site: #{Site.find(params[:subject][:site_id]).name}..."
      else
        redirect_to subjects_index_path, notice: "Subject cannot be added, maximum limit of subjects for study is reached"
      end

    end
  end

  def new
    @subject = Subject.new
  end

  def feedback
    @subject = Subject.find(params[:id])
  end

  def rate
    @subject = Subject.find_by("id = ?", params[:id])
    rating = params[:subject][:rating]
    if @subject.update(rating: rating)
      redirect_to subjects_index_path, notice: "Rating is captured!"
    end
    #render json: {sub: @subject}
    # if @subject.update(rating: params[] )
    # render plain: 'OK'
    # {"param_key":{"_method":"patch","authenticity_token":"zeumNJbZoeu2rGQX364s84nOEQqQF-jx43E5lK6J9IFsTq2O9u74ihZyzdIX_4f
    # VwMNrXb07UlNa30kfQFvr5A","subject":{"rating":"Neutral"},"commit":"SUBMIT","controller":"subjects","action":"rate","id":"10"}}
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to subjects_index_path
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      @parent_site = Site.find(@subject.site_id)
      @parent_site.update(no_of_subjects: @parent_site.no_of_subjects - 1)
      redirect_to subjects_index_path
    else
      render plain: "cant be deleted"
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :screening_no, :status, :enrollment_date, :end_date, :site_id, :email)
  end

  def get_study_site_for_select

    @studies = Study.all
    #@sites = Site.find_by("study_id = ?")
  end

  def update_sites
    @sites = Site.where("study_id = ?", params[:study_id])
    respond_to do |format|
      format.js
    end
  end
end
