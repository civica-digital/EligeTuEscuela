class School < ActiveRecord::Base
  SEMAPHORE_STATUSES = ['Excelente', 'Bien', 'De panzazo', 'Reprobado',
                        'Escuela no confiable']

  reverse_geocoded_by :latitude, :longitude
  serialize :enlace_results
  serialize :contact_info, Hash

  def full_address
    address = "#{self.address} #{self.suburb} "
    address << "entre #{self.between_street_1} " unless self.between_street_1.blank?
    unless between_street_2.blank?
      address << (self.between_street_1.blank? ? "entre " : "y ")
      address << self.between_street_2
    end
    address << ", Culiacán, Sinaloa. #{self.zip_code}"
  end

  def preregistered_students_count
    self.max_availability - self.availability
  end

  def contact_name
    self.contact_info[:name]
  end

  def contact_position
    self.contact_info[:position]
  end

  def contact_hours
    self.contact_info[:schedule]
  end

  def availability_data_valid?
    self.max_availability > 0
  end

  def self.count_for_similar_to(school)
    School.where(grade: school.grade).count
  end

end
