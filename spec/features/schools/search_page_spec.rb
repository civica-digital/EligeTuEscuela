require 'spec_helper'

feature 'SearchPage' do
  scenario 'I can click on a school name and go to its profile page' do
    school = FactoryGirl.create(:school)
    search_for_school_in_home_page(school)
    click_link school.name
    current_url.should eq school_url(school)
  end
end
