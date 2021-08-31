# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destruyendo archivos"
Booking.destroy_all
Service.destroy_all
User.destroy_all

puts "creando usuarios"

User.create email: "admin@mail.com", password: "123456", permission_level: 2
User.create email: "owner@mail.com", password: "123456", permission_level: 1
User.create email: "caro@mail.com", password: "123456", permission_level: 0

puts "finish"