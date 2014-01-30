class SchoolsController < ApplicationController

  before_filter :get_school, only: [:show]

  def search
    @school_searcher = SchoolSearcher.new(params[:school_searcher])
    if @school_searcher.valid?
      persist_search_info_in_session
      @home = Geocoder.coordinates(@school_searcher.full_address)
      @schools = @school_searcher.schools_by_distance
    else
      render 'pages/home'
    end
  end

  def show
  end

  def filter
    @school_searcher = SchoolSearcher.new(extract_search_info_from_session)
    if @school_searcher.valid? && params[:school_filters].present?
      @schools = @school_searcher.schools_by_distance(params[:school_filters])
      render json: @schools.to_json(methods: [:full_address])
    else
      if @school_searcher.valid?
        render json: t('errors.messages.missing_filters'), status: :unprocessable_entity
      else
        render json: t('errors.messages.invalid_filter_search'), status: :unprocessable_entity
      end
    end
  end

  private

  def persist_search_info_in_session
    session[:school_search] = @school_searcher.serialize_for_session
  end

  def extract_search_info_from_session
    JSON.parse(session[:school_search])
  end

  def get_school
    @school ||= School.find(params[:id])
  end

end
