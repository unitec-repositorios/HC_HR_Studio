# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

Area.create!([{
  area_id_number: "1",
  name: "Area1",
},
{
  area_id_number: "2",
  name: "Area2",
}])

Education.create!([{
  major_description: "Educacion 1"
},
{
  major_description: "Educacion 2"
}])

School.create!([{
  name: "Institucion 1",
  cellphone: 0,
  address: ""
}])

Ability.create!([{
  ability_name: "Habilidad 1"
},
{
  ability_name: "Habilidad 2"
}])

Department.create!([{
  area_id: "1",
  name: "Departamento 1",
  department_id_number: "1"
},
{
  area_id: "2",
  name: "Departamento 2",
  department_id_number: "2"
}])


