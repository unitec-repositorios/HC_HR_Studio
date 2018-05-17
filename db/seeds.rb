# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

Area.create!([{
  area_id_number: "1-01",
  name: "Departamentos Administrativos",
},
{
  area_id_number: "1-10",
  name: "Proceso de Aceite Crudo",
},
{
  area_id_number: "1-30",
  name: "Costos indirectos (extractora)",
}])

Education.create!([{
  major_description: "Ingeniero Industrial o Carrera a Fin"
},
{
  major_description: "Licenciado en Administración de Empresas o Ingeniero Industrial."
},
{
  major_description: "Secundaria Completa ( Perito Mercantil preferentemente)"
},
{
  major_description: "Secundaria Completa"
},
{
  major_description: "Ingeniero En El Área Industria, Ambiental O Químico; Preferiblemente Orientado En El Sector De Palma Africana Y En Temas Ambientales.  "
},
{
  major_description: "Primaria Completa"
},
{
  major_description: "Pasante de carrera universitaria (administración, producción, agrícola, etc.)"
},
{
  major_description: "Que tenga licencia para conducir carro liviano"
},
{
  major_description: "Técnico en mecánica, soldadura Industrial, graduado o con experiencia comprobada"
},
{
  major_description: "Técnico en Mecánica Industrial, Técnico Electricista o carrera afín."
}])

School.create!([{
  name: "UNAH-VS",
  cellphone: 0,
  address: "Col. Universidad"
}])

Ability.create!([{
  ability_name: "Relaciones interpersonales"
}])

Department.create!([{
  area_id: "1-01",
  name: "Asamblea general",
  department_id_number: "01-01"
},
{
  area_id: "1-30",
  name: "Gerencia ambiental",
  department_id_number: "30-13"
}])



