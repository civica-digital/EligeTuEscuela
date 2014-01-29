class School < ActiveRecord::Base
  GRADES = %i(Primaria Secundaria)
  CITIES = %i(Cualiacán)
  reverse_geocoded_by :latitude, :longitude


  def to_address
    "#{address} #{suburb}, Culiacán, Sinaloa. #{zip_code}"
  end
end
