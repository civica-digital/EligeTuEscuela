require 'spec_helper'

describe SchoolSearcher do
  let(:address) { 'Mariano Abasolo Sn, Gabriel Leyva, 80030 Culiacán, Sinaloa' }

  describe '#schools_by_distance' do

    before do
      FactoryGirl.create(:school, grade: 'Primaria', shift: 'Matutino')
      FactoryGirl.create(:school, grade: 'Secundaria', shift: 'Vespertino')
    end

    it 'filters the schools by grade' do
      schools = SchoolSearcher.new(address, grade: 'Primaria').schools_by_distance
      # Can't use pluck, explained in Geocoder README
      schools_grade = schools.map {|school| school.grade}
      expect(schools_grade).to eq(['Primaria'])
    end

    it 'filters the schools by shift' do
      schools = SchoolSearcher.new(address, shift:'Matutino').schools_by_distance
      schools_shift = schools.map {|school| school.shift}
      expect(schools_shift).to eq(['Matutino'])
    end

  end
end
