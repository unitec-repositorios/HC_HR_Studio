# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
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