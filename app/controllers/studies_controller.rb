class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end
end
