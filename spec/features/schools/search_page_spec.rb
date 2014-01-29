require 'spec_helper'

feature 'SearchPage' do
  given!(:school_one) { FactoryGirl.create(:school, shift: 'Matutino') }
  given!(:school_two) { FactoryGirl.create(:school, name: 'Escuela #1', shift: 'Vespertino') }

  scenario 'I can click on a school name and go to its profile page' do
    search_for_school_in_home_page(school_one)
    click_link school_one.name
    current_url.should eq school_url(school_one)
  end

  scenario 'I can filter schools by its shift', js: true do
    search_for_school_in_home_page(school_one)
    within '#filter_schools' do
      find(:xpath, "//input[@value='Matutino']").set(true)
      click_button I18n.t('helpers.filter')
    end
    page.should have_content(school_one.name)
    page.should_not have_content(school_two.name)
  end
end
