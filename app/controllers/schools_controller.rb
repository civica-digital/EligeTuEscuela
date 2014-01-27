class SchoolsController < ApplicationController

  before_filter :get_school, only: [:show]

  def search
    address = format_full_address_from_search
    @home= Geocoder.coordinates(address);
    @schools = SchoolSearcher.new(address, grade: params[:nivel]).schools_by_distance
  end

  def show
  end


  private

  def format_full_address_from_search
    "#{params[:domicilio]} #{params[:colonia]}, #{params[:ciudad]}, Sinaloa, #{params[:codigo_postal]}"
  end

  def get_school
    @school ||= School.find(params[:id])
  end

end
