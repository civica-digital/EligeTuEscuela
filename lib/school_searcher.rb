class SchoolSearcher
  RADIUS = 10

  def initialize(address, options={})
    @full_address = address
    @options = options
  end

  def schools_by_distance
    @schools = School.near(@full_address, RADIUS)
    @schools = with_grade unless @options[:grade].blank?
    @schools = with_shift unless @options[:shift].blank?
    @schools.limit(100).order('distance, availability DESC')
  end

  private

  def with_grade
    @schools.where(grade: @options[:grade])
  end

  def with_shift
    @schools.where(shift: @options[:shift])
  end

end
