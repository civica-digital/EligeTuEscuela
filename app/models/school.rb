class School < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def full_address
    "#{address} #{suburb}, Culiacán, Sinaloa. #{zip_code}"
  end

end
