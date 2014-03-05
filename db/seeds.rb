# Cleanup
School.destroy_all

# Parsing the JSON data
puts 'Parsing data from schools....'
parsed_schools = JSON.parse(File.read('db/seeds/sinaloa.json'))

# Saving the Schools to the DB
puts 'Creating schools....'
parsed_schools.each do |school|
  unless school['nombre'].blank?
    data = {
      imco_id: school['id'],
      cct: school['cct'],
      name: school['nombre'].try(:capitalize),
      address: school['domicilio'].try(:capitalize),
      between_street_1: school['entre_calle_1'].try(:capitalize),
      between_street_2: school['entre_calle_2'].try(:capitalize),
      suburb: school['colonia'].try(:capitalize),
      zip_code: school['codigo_postal'],
      phone_number: school['telefono'],
      phone_extension: school['telextension'],
      fax: school['fax'],
      fax_extension: school['faxextension'],
      email: school['correo_electronico'],
      web_page: school['pagina_web'],
      altitude: school['altitud'],
      longitude: school['longitud'],
      latitude: school['latitud'],
      kind: school['privada_publica'].try(:capitalize),
      grade: school['nivel'].try(:capitalize),
      shift: school['turno'].try(:capitalize),
      state_rank: school['posicion_estatal'],
      city_rank: school['posicion_municipal'],
      enlace_results: school['resultados_enlace'],
      total_students: school['num_alumnos'],
      total_evaluated_students: school['total_alumnos_evaluados'],
      educational_semaphore: school['semaforo'],
      total_teachers: school['num_personal'],
      level: school['tipo'],
      contact_info: {name: 'Juan Orozco', position: 'Director', schedule: '9:00 - 10:00' }
    }
    School.create(data)
  end
end
