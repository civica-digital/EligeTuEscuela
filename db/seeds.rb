# Cleanup
School.destroy_all

GRADES = %i{Primaria Secundaria}
SHIFTS = %i{Matutino Vespertino Nocturno Mixto}


# Hit the IMCO API
puts 'Hitting the API...'
raw_json = RestClient.get('http://api.imco.org.mx/imco-compara-escuela/web_service.php?accion=datos.generales.escuela.x.municipio&id_entidad=1909')
response = JSON.parse(raw_json)

# 148890 - Culiacán Rosales
puts 'Creating schools....'
response['localidades']['148890']['datos_escuelas'].each do |key, val|
  unless val['nombre'].blank?
    values = {
      cct: val['cct'],
      name: val['nombre'].try(:capitalize),
      address: val['domicilio'].try(:capitalize),
      between_street_1: val['entre_calle_1'].try(:capitalize),
      between_street_2: val['entre_calle_2'].try(:capitalize),
      suburb: val['colonia'].try(:capitalize),
      zip_code: val['codigo_postal'],
      phone_number: val['telefono'],
      phone_extension: val['telextension'],
      fax: val['fax'],
      fax_extension: val['fax_extension'],
      email: val['correo_electronico'],
      web_page: val['pagina_web'],
      altitude: val['altitud'],
      longitude: val['longitud'],
      latitude: val['latitud'],
      kind: 'Pública',
      grade: GRADES.sample,
      shift: SHIFTS.sample,
      state_rank: rand(1..1055),
      city_rank: rand(1..1055),
      total_students: rand(300..500),
      total_evaluated_students: rand(300..500),
      educational_semaphore: 'De panzaso',
      total_teachers: rand(1..30),
      budget: '1000000.00',
      availability: rand(0..100),
    }
    School.create(values)
  end
end
