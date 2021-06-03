class SubjectsController < ApplicationController
  def index
    @subjects = ''
  end

  def show
    @subjects = Subject.where(site_id: params[:site_id])
    render :index
  end

  def create
    #ForbiddenAttributesError.html
    # @subject = Subject.new(params[:subject])
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_index_path
    else
      render :new
    end
  end

  def new
    @subject = Subject.new
  end

  def feedback
    @subject = Subject.find(params[:id])
  end

  def rate
    @subject = Subject.find(params[:id])
    render json: {param_key: params}
    #render json: {sub: @subject}
    # if @subject.update(rating: params[] )
    # render plain: 'OK'
    # {"param_key":{"_method":"patch","authenticity_token":"zeumNJbZoeu2rGQX364s84nOEQqQF-jx43E5lK6J9IFsTq2O9u74ihZyzdIX_4f
    # VwMNrXb07UlNa30kfQFvr5A","subject":{"rating":"Neutral"},"commit":"SUBMIT","controller":"subjects","action":"rate","id":"10"}}
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :screening_no, :status, :enrollment_date, :end_date, :site_id, :email)
  end
end
