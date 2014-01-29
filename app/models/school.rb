class School < ActiveRecord::Base
  GRADES = %i(Primaria Secundaria)
  CITIES = %i(Culiacán)
  reverse_geocoded_by :latitude, :longitude


  def full_address
    "#{address} #{suburb}, Culiacán, Sinaloa. #{zip_code}"
  end
end
