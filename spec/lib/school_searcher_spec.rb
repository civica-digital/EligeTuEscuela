require 'spec_helper'

describe SchoolSearcher do
  let(:options) { {street_and_number: 'Mariano Abasolo Sn',
                   suburb: 'Gabriel Leyva',
                   zip_code: '80030',
                   city: 'Culiacan',
                   grade: 'Primaria'} }

  describe 'validations' do

    it { should validate_presence_of(:street_and_number) }
    it { should validate_presence_of(:suburb) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:grade) }

    it { should ensure_inclusion_of(:city).in_array(%w(Culiacán)) }
    it { should ensure_inclusion_of(:grade).in_array(%w(Primaria Secundaria)) }

  end

  describe '#schools_by_distance' do

    before do
      FactoryGirl.create(:school, grade: 'Primaria', shift: 'Matutino')
      FactoryGirl.create(:school, grade: 'Secundaria', shift: 'Vespertino')
    end

    it 'filters the schools by grade' do
      schools = SchoolSearcher.new(options).schools_by_distance
      # Can't use pluck, explained in Geocoder README
      schools_grade = schools.map {|school| school.grade}
      expect(schools_grade).to eq(['Primaria'])
    end

    it 'filters the schools by shift' do
      schools = SchoolSearcher.new(options.merge(shift: ['Matutino'])).schools_by_distance
      schools_shift = schools.map {|school| school.shift}
      expect(schools_shift).to eq(['Matutino'])
    end

  end
end
