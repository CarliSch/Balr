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
MatchUser.destroy_all
puts "Database clean!"

puts "Creating Users..."
carl = User.create!(first_name: "Carl", last_name: "Schierstaedt", email: "carl@gmail.com", password: "123456", city: "Munich", age: "19", position: "Center back")
august = User.create!(first_name: "August", last_name: "Wanger", email: "august@gmail.com", password: "123456", city: "Stockholm", age: "19", position: "Left Back")
ruben = User.create!(first_name: "Ruben", last_name: "Asmus", email: "ruben@gmail.com", password: "123456", city: "Berlin", age: "19", position: "Striker")
pauli = User.create!(first_name: "Paul-Henri", last_name: "Eichhorn", email: "pauli@gmail.com", password: "123456", city: "Cologne", age: "18", position: "Right Back")
claire = User.create!(first_name: "Claire", last_name: "Gautier", email: "claire@gmail.com", password: "123456", city: "Bordeaux", age: "27", position: "Goalkeeper")
eva = User.create!(first_name: "Eva", last_name: "Diedonne", email: "eva@gmail.com", password: "123456", city: "Paris", age: "26", position: "Sweeper")
juan = User.create!(first_name: "Juan", last_name: "Delgado", email: "juan@gmail.com", password: "123456", city: "Stockholm", age: "36", position: "Left Mid")
sebastian = User.create!(first_name: "Sebastian", last_name: "Gustavsson", email: "sebastian@gmail.com", password: "123456", city: "Stockholm", age: "24", position: "Right Mid")
puts "Users created!"

puts "Creating Matches..."
match1 = Match.create(location: "Brunnsviksvägen 10, 113 47 Stockholm", start_at: DateTime.parse("01/02/2022 8:00") )
match2 = Match.create(location: "Stockholm, 117, 111 21 Stockholm", start_at: DateTime.parse("14/12/2021 12:00"))
match3 = Match.create(location: "Maria, Södermalm, Stockholm", start_at: DateTime.parse("04/12/2021 18:00"))
match4 = Match.create(location: "Södermannagatan 63, 116 66 Stockholm", start_at: DateTime.parse("05/12/2021 18:00"))
match5 = Match.create(location: "Åminnevägen 23, 104 05 Stockholm", start_at: DateTime.parse("06/12/2021 14:00"))
match6 = Match.create(location: "Skånegatan 117, 116 35 Stockholm", start_at: DateTime.parse("07/12/2021 16:00"))
match7 = Match.create(location: "Ringvägen 60, 118 61 Stockholm", start_at: DateTime.parse("08/12/2021 19:00"))
Match.create(location: "Svärdlångsvägen 22, 120 60 Årsta", start_at: DateTime.parse("09/12/2021 21:00"))
puts "Matches created!"

puts "Creating match_users..."
MatchUser.create(user: carl, team: "A", match: match1)
MatchUser.create(user: ruben, team: "A", match: match1)
MatchUser.create(user: august, team: "A", match: match1)
MatchUser.create(user: eva, team: "A", match: match1)
MatchUser.create(user: claire, team: "B", match: match1)
MatchUser.create(user: juan, team: "B", match: match1)
MatchUser.create(user: sebastian, team: "B", match: match1)
MatchUser.create(user: pauli, team: "B", match: match1)

MatchUser.create(user: sebastian, team: "B", match: match2)
MatchUser.create(user: pauli, team: "B", match: match2)
MatchUser.create(user: eva, team: "A", match: match1)
MatchUser.create(user: ruben, team: "A", match: match1)

MatchUser.create(user: ruben, team: "A", match: match3)
MatchUser.create(user: carl, team: "A", match: match3)
MatchUser.create(user: juan, team: "B", match: match3)

MatchUser.create(user: carl, team: "A", match: match4)
MatchUser.create(user: ruben, team: "A", match: match4)
MatchUser.create(user: august, team: "A", match: match4)
MatchUser.create(user: eva, team: "A", match: match4)
MatchUser.create(user: claire, team: "B", match: match4)
MatchUser.create(user: juan, team: "B", match: match4)

MatchUser.create(user: august, team: "A", match: match5)
MatchUser.create(user: eva, team: "A", match: match5)
MatchUser.create(user: claire, team: "B", match: match5)
MatchUser.create(user: juan, team: "B", match: match5)
MatchUser.create(user: sebastian, team: "B", match: match5)
MatchUser.create(user: pauli, team: "B", match: match5)

MatchUser.create(user: august, team: "A", match: match6)
MatchUser.create(user: eva, team: "A", match: match6)
MatchUser.create(user: claire, team: "B", match: match6)
MatchUser.create(user: juan, team: "B", match: match6)

MatchUser.create(user: august, team: "A", match: match7)
puts "Created match_users!"

file = URI.open('https://images.unsplash.com/photo-1484611941511-3628849e90f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60')
carl.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
carl.save!

file1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
august.photo.attach(io: file1, filename: 'abc.png', content_type: 'image/png')
august.save!

file2 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
ruben.photo.attach(io: file2, filename: 'def.png', content_type: 'image/png')
ruben.save!

file3 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
pauli.photo.attach(io: file3, filename: 'ghi.png', content_type: 'image/png')
pauli.save!

file4 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
claire.photo.attach(io: file4, filename: 'jkl.png', content_type: 'image/png')
claire.save!

file5 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
eva.photo.attach(io: file5, filename: 'mno.png', content_type: 'image/png')
eva.save!

file6 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
juan.photo.attach(io: file6, filename: 'pqr.png', content_type: 'image/png')
juan.save!

file7 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
sebastian.photo.attach(io: file7, filename: 'stu.png', content_type: 'image/png')
sebastian.save!

puts "Done!"
