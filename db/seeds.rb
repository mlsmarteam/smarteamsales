# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Martin",
			 last_name:"Lopez",
             email: "millopez94@gmail.com",
             password:              "3doorsdown",
             password_confirmation: "3doorsdown")

DocType.create!(name:"Documento nacional de identidad")
DocType.create!(name:"Pasaporte")
DocType.create!(name:"Libreta de enrolamiento")



