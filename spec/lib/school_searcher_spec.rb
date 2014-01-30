require 'spec_helper'

describe SchoolSearcher do
  let(:options) { {street_and_number: 'Mariano Abasolo Sn',
                   suburb: 'Gabriel Leyva',
                   zip_code: '80030',
                   city: 'Culiacan',
                   grade: 'Primaria'} }

  describe 'validations' do

    context 'when not geocoded' do
      before do
        subject.stub(:latitude) { nil }
        subject.stub(:longitude) { nil }
      end
      it { should validate_presence_of(:street_and_number) }
      it { should validate_presence_of(:suburb) }
      it { should validate_presence_of(:zip_code) }
      it { should validate_presence_of(:city) }
      it { should ensure_inclusion_of(:city).in_array(%w(Culiacán)) }
    end

    context 'when already geocoded' do
      before do
        subject.stub(:latitude) { 24.819967 }
        subject.stub(:longitude) { -107.398672 }
      end
      it { should_not validate_presence_of(:street_and_number) }
      it { should_not validate_presence_of(:suburb) }
      it { should_not validate_presence_of(:zip_code) }
      it { should_not validate_presence_of(:city) }
      it { should_not ensure_inclusion_of(:city).in_array(%w(Culiacán)) }
    end

    it { should validate_presence_of(:grade) }
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

  describe '.geocoded?' do
    before do
      subject.latitude = 24.819967
      subject.longitude = -107.398672
    end

    it 'is true when latitude and longitude are not nil' do
      expect(subject.geocoded?).to be true
    end

    it 'is false when latitude is nil' do
      subject.latitude = nil
      expect(subject.geocoded?).to be false
    end

    it 'is false when longitude is nil' do
      subject.longitude = nil
      expect(subject.geocoded?).to be false
    end

    it 'is false when latitude & longitude are nil' do
      subject.latitude = nil
      subject.longitude = nil
      expect(subject.geocoded?).to be false
    end
  end

  describe '.origin_coordinates' do
    it 'returns an array with lat & lon when the subject was previously geocoded' do
      subject.latitude = 24.819967
      subject.longitude = -107.398672
      expect(subject.origin_coordinates).to eq([subject.latitude, subject.longitude])
    end

    it 'returns an array with the geocoded address' do
      random_coordinates = [20.11900, -100.2312]
      Geocoder.stub(:coordinates).and_return(random_coordinates)
      expect(subject.origin_coordinates).to eq(random_coordinates)
    end
  end

end
