class SchoolsController < ApplicationController

  def search
    # Armar la dirección
    address = format_full_address_from_search
    @schools = SchoolSearcher.new(address, grade: params[:nivel]).schools_by_distance
  end


  private

  def format_full_address_from_search
    "#{params[:domicilio]} #{params[:colonia]}, #{params[:ciudad]}, Sinaloa, #{params[:codigo_postal]}"
  end

end
