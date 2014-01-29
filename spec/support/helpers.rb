def search_for_school_in_home_page(school)
  visit root_path
  within '#new_school_searcher' do
    fill_in 'school_searcher[street_and_number]', with: school.address
    fill_in 'school_searcher[suburb]', with: school.suburb
    fill_in 'school_searcher[zip_code]', with: school.zip_code
    select SchoolSearcher::CITIES.first, from: 'school_searcher[city]'
    select school.grade, from: 'school_searcher[grade]'
    click_button I18n.t('helpers.search')
  end
end
