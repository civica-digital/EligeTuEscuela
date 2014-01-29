require 'spec_helper'

describe 'HomePage' do
  describe 'we can search for schools' do
    it 'redirects to a view with the corresponding schools' do
      school = FactoryGirl.create(:school)
      search_for_school_in_home_page(school)
      page.should have_content(school.name)
    end
  end
end
