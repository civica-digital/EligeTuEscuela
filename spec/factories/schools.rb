# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :school do
    cct "09AAA0001O"
    name "Academia de Artes"
    address "Mariano Abasolo"
    between_street_2 "Teresa Villegas"
    suburb "Gabriel Leyva"
    zip_code "80030"
    phone_number "7156064"
    fax "55667865"
    email "academiaartes@hotmail.com"
    web_page "www.conaculta.gob.mx"
    altitude 2244
    longitude '-107.398672'
    latitude 24.819967
    kind "pública"
    grade "Primaria"
    shift "Matutino"
    state_rank "3"
    city_rank "1"
    total_students "150"
    total_evaluated_students "33"
    educational_semaphore "excelente"
    grade_by_parents "8.9"
    budget "840000.00"
  end
end
