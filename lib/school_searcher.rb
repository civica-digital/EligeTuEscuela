require 'ostruct'

class SchoolSearcher < OpenStruct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  RADIUS = 10
  CITIES = %w(Culiacán)
  GRADES = %w(Primaria Secundaria)

  validates :street_and_number, :suburb, :zip_code, :city, :grade, presence: true
  validates :city, inclusion: { in: CITIES }
  validates :grade, inclusion: { in: GRADES }

  def initialize(*args)
    super
  end

  def persisted?
    false
  end

  def schools_by_distance(options={})
    @schools = School.near(full_address, RADIUS)
    @schools = with_grade
    @schools = with_shift(options[:shift]) unless options[:shift].blank?
    @schools.limit(100).order('distance, availability DESC')
  end

  def full_address
    @full_address ||= "#{street_and_number} #{suburb}, #{city}, Sinaloa, #{zip_code}"
  end

  def serialize_for_session
    self.as_json['table'].to_json
  end


  private

  def with_grade
    @schools.where(grade: grade)
  end

  def with_shift(shift)
    @schools.where(shift: shift)
  end

end
