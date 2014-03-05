module SchoolsHelper
  def marker_info_for_schools(schools)
    schools.to_json(only: [:latitude, :longitude, :name], :methods => [:full_address])
  end

  def marker_info_for_coordinates(coordinates, name="")
    {latitude: coordinates[0], longitude: coordinates[1], name: name}.to_json
  end

  def school_educational_semaphore_list_el(school)
    School::SEMAPHORE_STATUSES.map do |status|
      if status == school.educational_semaphore
        content_tag(:li, status, class: 'check')
      else
        content_tag(:li, status)
      end
    end
  end
end
