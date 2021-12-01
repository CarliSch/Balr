require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database..."
ClubRequest.destroy_all
Club.destroy_all
MatchUser.destroy_all
Match.destroy_all
User.destroy_all

puts "Database clean!"

puts "Creating Users..."
carl = User.create!(first_name: "Carl", last_name: "Schierstaedt", email: "carl@gmail.com", password: "123456", city: "Munich", birthday: "19.04.2002", position: "Center-back")
august = User.create!(first_name: "August", last_name: "Wanger", email: "august@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "Left Full-back")
ruben = User.create!(first_name: "Ruben", last_name: "Asmus", email: "ruben@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2002", position: "Striker")
pauli = User.create!(first_name: "Paul-Henri", last_name: "Eichhorn", email: "pauli@gmail.com", password: "123456", city: "Cologne", birthday: "09.09.2003", position: "Right Full-back")
claire = User.create!(first_name: "Claire", last_name: "Gautier", email: "claire@gmail.com", password: "123456", city: "Bordeaux", birthday: "09.09.1994", position: "Goalkeeper")
eva = User.create!(first_name: "Eva", last_name: "Diedonne", email: "eva@gmail.com", password: "123456", city: "Paris", birthday: "09.09.1996", position: "Sweeper")
juan = User.create!(first_name: "Juan", last_name: "Delgado", email: "juan@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1987", position: "Center-back")
user11 = User.create!(first_name: "Ben", last_name: "Smith", email: "ben@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "Defensive Midfielder")
user1 = User.create!(first_name: "Lilli", last_name: "Johnson", email: "lilli@gmail.com", password: "123456", city: "London", birthday: "09.09.1999", position: "Right Midfielder")
user2 = User.create!(first_name: "Max", last_name: "Andersson", email: "max@gmail.com", password: "123456", city: "York", birthday: "09.09.2003", position: "Center Midfielder")
user3 = User.create!(first_name: "Lukas", last_name: "Johansson", email: "lukas@gmail.com", password: "123456", city: "Munich", birthday: "09.09.2001", position: "Right Midfielder")
user4 = User.create!(first_name: "Melo", last_name: "Nilsson", email: "melo@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2000", position: "Attacking Midfielder")
user5 = User.create!(first_name: "Stephen", last_name: "Fischer", email: "steph@gmail.com", password: "123456", city: "Oslo", birthday: "09.09.1992", position: "Sweeper")
user6 = User.create!(first_name: "Will", last_name: "Schmidt", email: "will@gmail.com", password: "123456", city: "New York", birthday: "09.09.1999", position: "Left Full-back")
user7 = User.create!(first_name: "Tina", last_name: "Svensson", email: "tina@gmail.com", password: "123456", city: "Los Angeles", birthday: "09.09.2004", position: "Right Midfielder")
user8 = User.create!(first_name: "Anna", last_name: "Pettersson", email: "anna@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "Right Full-back")
user9 = User.create!(first_name: "Caroline", last_name: "Lindqvist", email: "caroline@gmail.com", password: "123456", city: "Prague", birthday: "09.09.2005", position: "Left Full-back")
user10 = User.create!(first_name: "Anton", last_name: "Lorenz", email: "anton@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1983", position: "Goalkeeper")
sebastian = User.create!(first_name: "Sebastian", last_name: "Gustavsson", email: "sebastian@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "Goalkeeper")
puts "Users created!"

puts "Creating Matches..."
match1 = Match.create!(location: "Brunnsviksvägen 10, 113 47 Stockholm", start_at: DateTime.parse("01/02/2022 8:00"), user: carl)
match2 = Match.create!(location: "Stockholm, 117, 111 21 Stockholm", start_at: DateTime.parse("14/12/2021 12:00"), user: august)
match3 = Match.create!(location: "Maria, Södermalm, Stockholm", start_at: DateTime.parse("04/12/2021 18:00"), user: claire)
match4 = Match.create!(location: "Södermannagatan 63, 116 66 Stockholm", start_at: DateTime.parse("05/12/2021 18:00"), user: pauli)
match5 = Match.create!(location: "Åminnevägen 23, 104 05 Stockholm", start_at: DateTime.parse("06/12/2021 14:00"), user: eva)
match6 = Match.create!(location: "Skånegatan 117, 116 35 Stockholm", start_at: DateTime.parse("07/12/2021 16:00"), user: juan)
match7 = Match.create!(location: "Ringvägen 60, 118 61 Stockholm", start_at: DateTime.parse("08/12/2021 19:00"), user: sebastian)
Match.create!(location: "Svärdlångsvägen 22, 120 60 Årsta", start_at: DateTime.parse("09/12/2021 21:00"), user: ruben)
puts "Matches created!"

puts "Creating match_users..."
MatchUser.create!(user: carl, team: "A", match: match1)
MatchUser.create!(user: ruben, team: "A", match: match1)
MatchUser.create!(user: august, team: "A", match: match1)
MatchUser.create!(user: eva, team: "A", match: match1)
MatchUser.create!(user: claire, team: "B", match: match1)
MatchUser.create!(user: juan, team: "B", match: match1)
MatchUser.create!(user: sebastian, team: "B", match: match1)
MatchUser.create!(user: pauli, team: "B", match: match1)

MatchUser.create!(user: sebastian, team: "B", match: match2)
MatchUser.create!(user: pauli, team: "B", match: match2)
MatchUser.create!(user: eva, team: "A", match: match2)
MatchUser.create!(user: ruben, team: "A", match: match2)

MatchUser.create!(user: ruben, team: "A", match: match3)
MatchUser.create!(user: carl, team: "A", match: match3)
MatchUser.create!(user: juan, team: "B", match: match3)

MatchUser.create!(user: carl, team: "A", match: match4)
MatchUser.create!(user: ruben, team: "A", match: match4)
MatchUser.create!(user: august, team: "A", match: match4)
MatchUser.create!(user: eva, team: "A", match: match4)
MatchUser.create!(user: claire, team: "B", match: match4)
MatchUser.create!(user: juan, team: "B", match: match4)

MatchUser.create!(user: august, team: "A", match: match5)
MatchUser.create!(user: eva, team: "A", match: match5)
MatchUser.create!(user: claire, team: "B", match: match5)
MatchUser.create!(user: juan, team: "B", match: match5)
MatchUser.create!(user: sebastian, team: "B", match: match5)
MatchUser.create!(user: pauli, team: "B", match: match5)

MatchUser.create!(user: august, team: "A", match: match6)
MatchUser.create!(user: eva, team: "A", match: match6)
MatchUser.create!(user: claire, team: "B", match: match6)
MatchUser.create!(user: juan, team: "B", match: match6)

MatchUser.create!(user: august, team: "A", match: match7)
puts "Created match_users!"

puts "Creating Clubs..."
club1 = Club.new(name: "Real MaBalr")
club1.user_id = august.id
club_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/10/Escudo_real_madrid_1941b.png')
club1.photo.attach(io: club_file, filename: 'nes.png', content_type: 'image/png')
club1.save!
ClubRequest.create!(user: club1.user, club: club1, status: "accepted")

club2 = Club.new(name: "Balrlona")
club2.user_id = carl.id
club_file2 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png')
club2.photo.attach(io: club_file2, filename: 'abc.png', content_type: 'image/png')
club2.save!
ClubRequest.create!(user: club2.user, club: club2, status: "accepted")

club3 = Club.new(name: "Manbalr United")
club3.user_id = eva.id
club_file3 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/640px-Manchester_United_FC_crest.svg.png')
club3.photo.attach(io: club_file3, filename: 'def.png', content_type: 'image/png')
club3.save!
ClubRequest.create!(user: club3.user, club: club3, status: "accepted")

club4 = Club.new(name: "Manbalr City")
club4.user_id = claire.id
club_file4 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png')
club4.photo.attach(io: club_file4, filename: 'ghi.png', content_type: 'image/png')
club4.save!
ClubRequest.create!(user: club4.user, club: club4, status: "accepted")

club5 = Club.new(name: "BSG")
club5.user_id = ruben.id
club_file5 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/a/a7/Paris_Saint-Germain_F.C..svg/1200px-Paris_Saint-Germain_F.C..svg.png')
club5.photo.attach(io: club_file5, filename: 'ghi.png', content_type: 'image/png')
club4.save!
ClubRequest.create!(user: club5.user, club: club5, status: "accepted")

puts "Creating Club Requests..."
ClubRequest.create!(user: user1, club: club1, status: "accepted")
ClubRequest.create!(user: user2, club: club2, status: "accepted")
ClubRequest.create!(user: user3, club: club3, status: "accepted")
ClubRequest.create!(user: user4, club: club4, status: "accepted")
ClubRequest.create!(user: user5, club: club5, status: "accepted")
ClubRequest.create!(user: user6, club: club1, status: "accepted")
ClubRequest.create!(user: user7, club: club2, status: "accepted")
ClubRequest.create!(user: user8, club: club3, status: "accepted")
ClubRequest.create!(user: user9, club: club4, status: "accepted")
ClubRequest.create!(user: user10, club: club5, status: "accepted")
ClubRequest.create!(user: sebastian, club: club1, status: "accepted")
ClubRequest.create!(user: juan, club: club2, status: "accepted")
ClubRequest.create!(user: pauli, club: club3, status: "accepted")
ClubRequest.create!(user: user11, club: club4, status: "accepted")

file = File.open(Rails.root.join('db/fixtures/users/carl.jpg'))
carl.photo.attach(io: file, filename: 'carl.jpg', content_type: 'image/png')
carl.save!

file1 = URI.open('https://images.unsplash.com/photo-1631014611398-c6109909b66a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydGFpdHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
august.photo.attach(io: file1, filename: 'abc.png', content_type: 'image/png')
august.save!

file2 = URI.open('https://images.unsplash.com/photo-1620293023555-272e1a661b26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHBvcnRhaXRzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60')
ruben.photo.attach(io: file2, filename: 'def.png', content_type: 'image/png')
ruben.save!

file3 = URI.open('https://images.unsplash.com/photo-1623605931891-d5b95ee98459?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHBvcnRhaXRzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60')
pauli.photo.attach(io: file3, filename: 'ghi.png', content_type: 'image/png')
pauli.save!

file4 = URI.open('https://images.unsplash.com/photo-1630520138985-43ef3c8b6bf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydGFpdHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
claire.photo.attach(io: file4, filename: 'jkl.png', content_type: 'image/png')
claire.save!

file5 = URI.open('https://images.unsplash.com/photo-1621963450287-51c36a591f8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHBvcnRhaXRzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60')
eva.photo.attach(io: file5, filename: 'mno.png', content_type: 'image/png')
eva.save!

file6 = URI.open('https://images.unsplash.com/photo-1610447610665-f695c56133a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fHBvcnRhaXRzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60')
juan.photo.attach(io: file6, filename: 'pqr.png', content_type: 'image/png')
juan.save!

file7 = URI.open('https://images.unsplash.com/photo-1622039949253-d11b923ee78c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydGFpdHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
sebastian.photo.attach(io: file7, filename: 'stu.png', content_type: 'image/png')
sebastian.save!



puts "Done!"
