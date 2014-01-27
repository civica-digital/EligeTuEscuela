class School < ActiveRecord::Base
  GRADES = %i(Primaria Secundaria)
  CITIES = %i(Cualiacán)
  reverse_geocoded_by :latitude, :longitude
end
