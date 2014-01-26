require 'spec_helper'

describe SchoolSearcher do
  let(:address) { 'Mariano Abasolo Sn, Gabriel Leyva, 80030 Culiacán, Sinaloa' }

  describe '#schools_by_distance' do
    it 'filters the schools by grade' do
      FactoryGirl.create(:school, grade: 'Primaria')
      FactoryGirl.create(:school, grade: 'Secundaria')
      schools = SchoolSearcher.new(address, grade: 'Primaria').schools_by_distance
      # Can't use pluck, explained in Geocoder README
      schools_grade = schools.map {|school| school.grade}
      expect(schools_grade).to eq(['Primaria'])
    end
  end
end
