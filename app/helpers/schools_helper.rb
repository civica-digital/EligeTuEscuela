module SchoolsHelper
  def marker_info_for_schools(schools)
    schools.to_json(only: [:latitude, :longitude, :name], :methods => [:to_address])
  end
  
  def marker_info_for_coordinates(coordinates, name="")
    {latitude: coordinates[0], longitude: coordinates[1], name: name}.to_json
  end
end
