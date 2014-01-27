def search_for_school_in_home_page(school)
  visit root_path
  within '#new_search_schools' do
    fill_in :domicilio, with: school.address
    fill_in :colonia, with: school.suburb
    fill_in :codigo_postal, with: '06030'
    select School::CITIES.first, from: :ciudad
    select 'Primaria', from: :nivel
    click_button I18n.t('helpers.search')
  end
end
