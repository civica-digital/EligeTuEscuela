class SchoolsController < ApplicationController

  before_filter :get_school, only: [:show]

  def search
    session[:address] = format_full_address_from_search
    session[:grade] = params[:nivel]
    @home = Geocoder.coordinates(session[:address])
    @schools = SchoolSearcher.new(session[:address], grade: session[:grade]).schools_by_distance
  end

  def show
  end

  def filter
    options = params.merge({grade: session[:grade]})
    @schools = SchoolSearcher.new(session[:address], options).schools_by_distance
    respond_to do |format|
        format.json { render :json => @schools.to_json(methods: [:full_address]) }
    end
  end

  private

  def format_full_address_from_search
    "#{params[:domicilio]} #{params[:colonia]}, #{params[:ciudad]}, Sinaloa, #{params[:codigo_postal]}"
  end

  def get_school
    @school ||= School.find(params[:id])
  end

end
