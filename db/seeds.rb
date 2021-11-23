require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database..."
User.destroy_all
Match.destroy_all


puts "Creating Users..."
carl = User.create!(first_name: "Carl", last_name: "Schierstaedt", email: "carl@gmail.com", password: "123456", city: "Munich", age: "19", position: "Center back")
august = User.create!(first_name: "August", last_name: "Wanger", email: "august@gmail.com", password: "123456", city: "Stockholm", age: "19", position: "Left Back")
ruben = User.create!(first_name: "Ruben", last_name: "Asmus", email: "ruben@gmail.com", password: "123456", city: "Berlin", age: "19", position: "Striker")
pauli = User.create!(first_name: "Paul-Henri", last_name: "Eichhorn", email: "pauli@gmail.com", password: "123456", city: "Cologne", age: "18", position: "Right Back")
claire = User.create!(first_name: "Claire", last_name: "Gautier", email: "claire@gmail.com", password: "123456", city: "Bordeaux", age: "27", position: "Goalkeeper")
eva = User.create!(first_name: "Eva", last_name: "Diedonne", email: "eva@gmail.com", password: "123456", city: "Paris", age: "26", position: "Sweeper")
juan = User.create!(first_name: "Juan", last_name: "Delgado", email: "juan@gmail.com", password: "123456", city: "Stockholm", age: "36", position: "Left Mid")
sebastian = User.create!(first_name: "Sebastian", last_name: "Gustavsson", email: "sebastian@gmail.com", password: "123456", city: "Stockholm", age: "24", position: "Right Mid")
puts "Users created"

puts "Creating Matches"



match1

MatchUser.create(user: carl, team: "A", match: match1)
MatchUser.create(user: ruben, team: "B", match: match1)

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
carl.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
august.photo.attach(io: file1, filename: 'abc.png', content_type: 'image/png')
