class SchoolSearcher
  RADIUS = 10

  def initialize(address, options={})
    @full_address = address
    @options = options
  end

  def schools_by_distance()
    schools = School.near(@full_address, RADIUS)
    schools.where(grade: @options[:grade]) unless @options[:grade].blank?
  end

end
