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
TournamentRequest.destroy_all
TournamentMatch.destroy_all
HomeTeam.destroy_all
AwayTeam.destroy_all
TournamentClub.destroy_all
TournamentGroup.destroy_all
TournamentKnockout.destroy_all
Club.destroy_all
MatchUser.destroy_all
Match.destroy_all
Challenge.destroy_all
Tournament.destroy_all
Creator.destroy_all
User.destroy_all
puts "Database clean!"

puts "Creating Users..."
carl = User.create!(first_name: "Carl", last_name: "Schierstaedt", email: "carl@gmail.com", password: "123456", city: "Munich", birthday: "19.04.2002", position: "GK")
august = User.create!(first_name: "August", last_name: "Wanger", email: "august@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "GK")
ruben = User.create!(first_name: "Ruben", last_name: "Asmus", email: "ruben@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2002", position: "GK")
pauli = User.create!(first_name: "Paul-Henri", last_name: "Eichhorn", email: "pauli@gmail.com", password: "123456", city: "Cologne", birthday: "09.09.2003", position: "GK")
claire = User.create!(first_name: "Claire", last_name: "Gautier", email: "claire@gmail.com", password: "123456", city: "Bordeaux", birthday: "09.09.1994", position: "GK")
eva = User.create!(first_name: "Eva", last_name: "Diedonne", email: "eva@gmail.com", password: "123456", city: "Paris", birthday: "09.09.1996", position: "LB")
juan = User.create!(first_name: "Juan", last_name: "Delgado", email: "juan@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1987", position: "LB")
user11 = User.create!(first_name: "Ben", last_name: "Smith", email: "ben@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "LB")
user1 = User.create!(first_name: "Lilli", last_name: "Johnson", email: "lilli@gmail.com", password: "123456", city: "London", birthday: "09.09.1999", position: "LB")
user2 = User.create!(first_name: "Max", last_name: "Andersson", email: "max@gmail.com", password: "123456", city: "York", birthday: "09.09.2003", position: "LB")
user3 = User.create!(first_name: "Gustav", last_name: "Schierstaedt", email: "gustav@gmail.com", password: "123456", city: "Munich", birthday: "09.09.2001", position: "RB")
user4 = User.create!(first_name: "Melo", last_name: "Nilsson", email: "melo@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2000", position: "RB")
user5 = User.create!(first_name: "Stephen", last_name: "Fischer", email: "steph@gmail.com", password: "123456", city: "Oslo", birthday: "09.09.1992", position: "RB")
user6 = User.create!(first_name: "Will", last_name: "Schmidt", email: "will@gmail.com", password: "123456", city: "New York", birthday: "09.09.1999", position: "RB")
user7 = User.create!(first_name: "Tina", last_name: "Svensson", email: "tina@gmail.com", password: "123456", city: "Los Angeles", birthday: "09.09.2004", position: "CB")
user8 = User.create!(first_name: "Anna", last_name: "Pettersson", email: "anna@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "CB")
user9 = User.create!(first_name: "Caroline", last_name: "Lindqvist", email: "caroline@gmail.com", password: "123456", city: "Prague", birthday: "09.09.2005", position: "CB")
user10 = User.create!(first_name: "Anton", last_name: "Lorenz", email: "anton@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1983", position: "DM")
sebastian = User.create!(first_name: "Sebastian", last_name: "Gustavsson", email: "sebastian@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "DM")
user12 = User.create!(first_name: "Johann", last_name: "Petersen", email: "johann@gmail.com", password: "123456", city: "Honolulu", birthday: "09.09.1994", position: "DM")
user13 = User.create!(first_name: "Julian", last_name: "Richter", email: "julian@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "RM")
user14 = User.create!(first_name: "Paul", last_name: "Wein", email: "paul@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1991", position: "RM")
user15 = User.create!(first_name: "Daniel", last_name: "Jung", email: "daniel@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2005", position: "RM")
user16 = User.create!(first_name: "Angelika", last_name: "Jusupova", email: "angelika@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2001", position: "CM")
user17 = User.create!(first_name: "Liv", last_name: "Lorenz", email: "liv@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "CM")
user18 = User.create!(first_name: "Mara", last_name: "Grabowski", email: "mara@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "CM")
user19 = User.create!(first_name: "Benedikt", last_name: "Conze", email: "benedikt@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1997", position: "ST")
user20 = User.create!(first_name: "Jannis", last_name: "Besch", email: "jannis@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2009", position: "ST")
user21 = User.create!(first_name: "Anton", last_name: "Pergold", email: "pergold@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2000", position: "ST")
user22 = User.create!(first_name: "Felix", last_name: "Rütters", email: "felix@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1960", position: "CAM")
user23 = User.create!(first_name: "Parsa", last_name: "Nejad", email: "parsa@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1975", position: "CAM")
user24 = User.create!(first_name: "Max", last_name: "Markus", email: "123@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "CAM")
user25 = User.create!(first_name: "Benjamin", last_name: "Dohna", email: "benjamin@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2002", position: "LM")
user26 = User.create!(first_name: "Yann", last_name: "Döhring", email: "yann@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "LM")
user27 = User.create!(first_name: "Jette", last_name: "Hambach", email: "jette@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "LM")
user28 = User.create!(first_name: "Anastasia", last_name: "Durkin", email: "anastasia@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "LM")
user29 = User.create!(first_name: "Larissa", last_name: "Klein", email: "larissa@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "CF")
user30 = User.create!(first_name: "Schend", last_name: "Olino", email: "schend@gmail.com", password: "123456", city: "Stockholm", birthday: "09.10.2002", position: "CF")
user31 = User.create!(first_name: "Levin", last_name: "Asmus", email: "richard@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2003", position: "CF")
user32 = User.create!(first_name: "Sylvester", last_name: "Schierstaedt", email: "sylvester@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2004", position: "CF")
user33 = User.create!(first_name: "Martha", last_name: "Lehmann", email: "martha@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2005", position: "CF")
user34 = User.create!(first_name: "Bruce", last_name: "Wayne", email: "bruce@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2006", position: "ST")
user35 = User.create!(first_name: "James", last_name: "Louis", email: "james@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2007", position: "ST")
user36 = User.create!(first_name: "Naomi", last_name: "Mann", email: "naomi@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.2008", position: "GK")
user37 = User.create!(first_name: "Bella", last_name: "Brent", email: "bella@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1999", position: "GK")
user38 = User.create!(first_name: "Luzia", last_name: "Specter", email: "luzia@gmail.com", password: "123456", city: "New York", birthday: "09.09.1998", position: "RM")
user39 = User.create!(first_name: "Thorben", last_name: "Wellnitz", email: "thorben@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.1997", position: "RM")
user40 = User.create!(first_name: "Kurt", last_name: "Becker", email: "kurt@gmail.com", password: "123456", city: "Stockholm", birthday: "09.09.1996", position: "RM")
user41 = User.create!(first_name: "Joko", last_name: "Winterscheid", email: "joko@gmail.com", password: "123456", city: "Munich", birthday: "09.09.1995", position: "CM")
user42 = User.create!(first_name: "Laura", last_name: "Bronsson", email: "laura@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.1994", position: "CM")
user43 = User.create!(first_name: "Ada", last_name: "Asmus", email: "ada@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2004", position: "CB")
user44 = User.create!(first_name: "Emy", last_name: "Randel", email: "emy@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2002", position: "CB")
user45 = User.create!(first_name: "John", last_name: "Paul", email: "john@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.1992", position: "ST")
user46 = User.create!(first_name: "Jackson", last_name: "Teller", email: "jackson@gmail.com", password: "123456", city: "Washington D.C", birthday: "09.09.1985", position: "CF")
user47 = User.create!(first_name: "Mary", last_name: "Jane", email: "mary@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2005", position: "CM")
user48 = User.create!(first_name: "Ben", last_name: "Mathews", email: "mathews@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2006", position: "CM")
user49 = User.create!(first_name: "Jules", last_name: "Jones", email: "jules@gmail.com", password: "123456", city: "Berlin", birthday: "09.09.2003", position: "GK")
user50 = User.create!(first_name: "Pierre", last_name: "Tissot", email: "ptissot@gmail.com", password: "123456", city: "Angers", birthday: "09.09.2003", position: "CB")
puts "Users created!"

puts "Creating Matches..."
match1 = Match.create!(location: "Brunnsviksvägen 10, 113 47 Stockholm", start_at: DateTime.parse("01/02/2022 8:00"), user: carl)
match2 = Match.create!(location: "Stockholm, 117, 111 21 Stockholm", start_at: DateTime.parse("14/12/2021 12:00"), user: august)
match3 = Match.create!(location: "Maria, Södermalm, Stockholm", start_at: DateTime.parse("04/12/2021 18:00"), user: claire)
match4 = Match.create!(location: "Södermannagatan 63, 116 66 Stockholm", start_at: DateTime.parse("05/12/2021 18:00"), user: pauli)
match5 = Match.create!(location: "Åminnevägen 23, 104 05 Stockholm", start_at: DateTime.parse("06/12/2021 14:00"), user: eva)
match6 = Match.create!(location: "Skånegatan 117, 116 35 Stockholm", start_at: DateTime.parse("07/12/2021 16:00"), user: juan)
match7 = Match.create!(location: "Ringvägen 60, 118 61 Stockholm", start_at: DateTime.parse("08/12/2021 19:00"), user: sebastian)
match8 = Match.create!(location: "Svärdlångsvägen 22, 120 60 Årsta", start_at: DateTime.parse("09/12/2021 21:00"), user: ruben)
match9 = Match.create!(location: "Mauerkirhcerstraße 54, Munich", start_at: DateTime.parse("02/02/2022 8:00"), user: carl, private_match: true)
match9 = Match.create!(location: "Mauerkirhcerstraße 54, Munich", start_at: DateTime.parse("10/02/2022 8:00"), user: carl, private_match: true)
puts "Matches created!"

puts "Creating match_users..."
MatchUser.create!(user: carl, team: "A", match: match1)
MatchUser.create!(user: ruben, team: "A", match: match1)
MatchUser.create!(user: august, team: "A", match: match1)
MatchUser.create!(user: eva, team: "A", match: match1)
MatchUser.create!(user: claire, team: "B", match: match1)
MatchUser.create!(user: juan, team: "B", match: match1)
MatchUser.create!(user: sebastian, team: "B", match: match1)
MatchUser.create!(user: user11, team: "B", match: match1)
MatchUser.create!(user: user2, team: "A", match: match1)
MatchUser.create!(user: user3, team: "A", match: match1)
MatchUser.create!(user: user4, team: "A", match: match1)
MatchUser.create!(user: user5, team: "A", match: match1)
MatchUser.create!(user: user6, team: "A", match: match1)
MatchUser.create!(user: user7, team: "A", match: match1)
MatchUser.create!(user: user8, team: "B", match: match1)
MatchUser.create!(user: user9, team: "B", match: match1)
MatchUser.create!(user: user10, team: "B", match: match1)
MatchUser.create!(user: user12, team: "B", match: match1)
MatchUser.create!(user: user13, team: "B", match: match1)

MatchUser.create!(user: sebastian, team: "B", match: match2)
MatchUser.create!(user: pauli, team: "B", match: match2)
MatchUser.create!(user: eva, team: "A", match: match2)
MatchUser.create!(user: ruben, team: "A", match: match2)
MatchUser.create!(user: user14, team: "B", match: match2)
MatchUser.create!(user: user15, team: "A", match: match2)
MatchUser.create!(user: user16, team: "B", match: match2)
MatchUser.create!(user: user17, team: "A", match: match2)
MatchUser.create!(user: user18, team: "B", match: match2)
MatchUser.create!(user: user19, team: "A", match: match2)
MatchUser.create!(user: user20, team: "B", match: match2)
MatchUser.create!(user: user21, team: "A", match: match2)
MatchUser.create!(user: user22, team: "B", match: match2)
MatchUser.create!(user: user23, team: "A", match: match2)
MatchUser.create!(user: user24, team: "B", match: match2)
MatchUser.create!(user: user25, team: "A", match: match2)

MatchUser.create!(user: ruben, team: "A", match: match3)
MatchUser.create!(user: carl, team: "A", match: match3)
MatchUser.create!(user: juan, team: "A", match: match3)
MatchUser.create!(user: sebastian, team: "A", match: match3)
MatchUser.create!(user: claire, team: "A", match: match3)
MatchUser.create!(user: pauli, team: "A", match: match3)
MatchUser.create!(user: august, team: "A", match: match3)
MatchUser.create!(user: eva, team: "A", match: match3)
MatchUser.create!(user: user11, team: "B", match: match3)
MatchUser.create!(user: user12, team: "B", match: match3)
MatchUser.create!(user: user13, team: "B", match: match3)
MatchUser.create!(user: user14, team: "B", match: match3)
MatchUser.create!(user: user15, team: "B", match: match3)
MatchUser.create!(user: user16, team: "B", match: match3)
MatchUser.create!(user: user17, team: "B", match: match3)
MatchUser.create!(user: user18, team: "B", match: match3)
MatchUser.create!(user: user19, team: "B", match: match3)
MatchUser.create!(user: user20, team: "B", match: match3)
MatchUser.create!(user: user21, team: "B", match: match3)

MatchUser.create!(user: carl, team: "A", match: match4)
MatchUser.create!(user: ruben, team: "A", match: match4)
MatchUser.create!(user: august, team: "A", match: match4)
MatchUser.create!(user: eva, team: "A", match: match4)
MatchUser.create!(user: claire, team: "B", match: match4)
MatchUser.create!(user: user1, team: "B", match: match4)
MatchUser.create!(user: user6, team: "B", match: match4)
MatchUser.create!(user: user9, team: "B", match: match4)
MatchUser.create!(user: sebastian, team: "A", match: match4)
MatchUser.create!(user: user22, team: "A", match: match4)
MatchUser.create!(user: user18, team: "A", match: match4)
MatchUser.create!(user: pauli, team: "B", match: match4)

MatchUser.create!(user: august, team: "A", match: match5)
MatchUser.create!(user: eva, team: "A", match: match5)
MatchUser.create!(user: claire, team: "B", match: match5)
MatchUser.create!(user: juan, team: "B", match: match5)
MatchUser.create!(user: sebastian, team: "B", match: match5)
MatchUser.create!(user: user6, team: "A", match: match5)
MatchUser.create!(user: user25, team: "A", match: match5)
MatchUser.create!(user: user24, team: "A", match: match5)
MatchUser.create!(user: user23, team: "A", match: match5)
MatchUser.create!(user: user29, team: "B", match: match5)
MatchUser.create!(user: user28, team: "B", match: match5)
MatchUser.create!(user: user27, team: "B", match: match5)
MatchUser.create!(user: user26, team: "B", match: match5)
MatchUser.create!(user: user18, team: "A", match: match5)
MatchUser.create!(user: user19, team: "A", match: match5)

MatchUser.create!(user: august, team: "A", match: match6)
MatchUser.create!(user: eva, team: "A", match: match6)
MatchUser.create!(user: claire, team: "B", match: match6)
MatchUser.create!(user: juan, team: "B", match: match6)
MatchUser.create!(user: user16, team: "A", match: match6)
MatchUser.create!(user: user18, team: "B", match: match6)
MatchUser.create!(user: user20, team: "A", match: match6)
MatchUser.create!(user: user29, team: "B", match: match6)
MatchUser.create!(user: user28, team: "A", match: match6)
MatchUser.create!(user: user13, team: "B", match: match6)
MatchUser.create!(user: user1, team: "A", match: match6)

MatchUser.create!(user: august, team: "A", match: match7)
MatchUser.create!(user: user1, team: "B", match: match7)
MatchUser.create!(user: user2, team: "A", match: match7)
MatchUser.create!(user: user3, team: "B", match: match7)
MatchUser.create!(user: user4, team: "A", match: match7)
MatchUser.create!(user: user5, team: "B", match: match7)
MatchUser.create!(user: user6, team: "A", match: match7)
MatchUser.create!(user: user7, team: "B", match: match7)
MatchUser.create!(user: user8, team: "A", match: match7)
MatchUser.create!(user: user9, team: "B", match: match7)
MatchUser.create!(user: user10, team: "A", match: match7)
MatchUser.create!(user: user11, team: "B", match: match7)
MatchUser.create!(user: user12, team: "A", match: match7)
MatchUser.create!(user: user13, team: "B", match: match7)
MatchUser.create!(user: user14, team: "A", match: match7)
MatchUser.create!(user: user15, team: "B", match: match7)
MatchUser.create!(user: user17, team: "A", match: match7)
MatchUser.create!(user: user18, team: "B", match: match7)
MatchUser.create!(user: user19, team: "A", match: match7)
MatchUser.create!(user: user20, team: "B", match: match7)
MatchUser.create!(user: user21, team: "A", match: match7)
MatchUser.create!(user: user22, team: "B", match: match7)
puts "Created match_users!"

puts "Creating Clubs..."
club1 = Club.new(name: "Real MaBalr")
club1.user_id = august.id
club_file = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/10/Escudo_real_madrid_1941b.png')
club1.photo.attach(io: club_file, filename: 'nes.png', content_type: 'image/png')
club1.save!
ClubRequest.create!(user: club1.user, club: club1, status: "accepted")

club2 = Club.new(name: "Balrlona")
club2.user_id = user26.id
club_file2 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png')
club2.photo.attach(io: club_file2, filename: 'abc.png', content_type: 'image/png')
club2.save!
ClubRequest.create!(user: club2.user, club: club2, status: "accepted")

club3 = Club.new(name: "Manbalr United")
club3.user_id = carl.id
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
club5.photo.attach(io: club_file5, filename: 'jkl.png', content_type: 'image/png')
club5.save!
ClubRequest.create!(user: club5.user, club: club5, status: "accepted")

club6 = Club.new(name: "Balr Chelsea")
club6.user_id = user21.id
club_file6 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png')
club6.photo.attach(io: club_file6, filename: 'mno.png', content_type: 'image/png')
club6.save!
ClubRequest.create!(user: club6.user, club: club6, status: "accepted")

club7 = Club.new(name: "Balr Milan")
club7.user_id = user22.id
club_file7 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/800px-FC_Internazionale_Milano_2021.svg.png')
club7.photo.attach(io: club_file7, filename: 'pqr.png', content_type: 'image/png')
club7.save!
ClubRequest.create!(user: club7.user, club: club7, status: "accepted")

club8 = Club.new(name: "AJAX Balr")
club8.user_id = user20.id
club_file8 = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/7/79/Ajax_Amsterdam.svg/800px-Ajax_Amsterdam.svg.png')
club8.photo.attach(io: club_file8, filename: 'stu.png', content_type: 'image/png')
club8.save!
ClubRequest.create!(user: club8.user, club: club8, status: "accepted")

club9 = Club.new(name: "Balr Dortmund")
club9.user_id = user18.id
club_file9 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Borussia_Dortmund_logo.svg/800px-Borussia_Dortmund_logo.svg.png')
club9.photo.attach(io: club_file9, filename: 'vwx.png', content_type: 'image/png')
club9.save!
ClubRequest.create!(user: club9.user, club: club9, status: "accepted")

club10 = Club.new(name: "Balr Munich")
club10.user_id = user28.id
club_file10 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png')
club10.photo.attach(io: club_file10, filename: 'yza.png', content_type: 'image/png')
club10.save!
ClubRequest.create!(user: club10.user, club: club10, status: "accepted")

puts "Creating Club Requests..."
ClubRequest.create!(user: user1, club: club1, status: "accepted")
ClubRequest.create!(user: user2, club: club2, status: "accepted")
ClubRequest.create!(user: user3, club: club3, status: "accepted")
ClubRequest.create!(user: user4, club: club4, status: "accepted")
ClubRequest.create!(user: user5, club: club5, status: "accepted")
ClubRequest.create!(user: user6, club: club1, status: "accepted")
ClubRequest.create!(user: user7, club: club2, status: "accepted")
ClubRequest.create!(user: user8, club: club8, status: "accepted")
ClubRequest.create!(user: user9, club: club4, status: "accepted")
ClubRequest.create!(user: user10, club: club5, status: "accepted")
ClubRequest.create!(user: sebastian, club: club1, status: "accepted")
ClubRequest.create!(user: juan, club: club2, status: "accepted")
ClubRequest.create!(user: pauli, club: club7, status: "accepted")
ClubRequest.create!(user: user11, club: club4, status: "accepted")
ClubRequest.create!(user: user12, club: club5, status: "accepted")
ClubRequest.create!(user: user13, club: club6, status: "accepted")
ClubRequest.create!(user: user14, club: club7, status: "accepted")
ClubRequest.create!(user: user15, club: club8, status: "accepted")
ClubRequest.create!(user: user16, club: club9, status: "accepted")
ClubRequest.create!(user: user17, club: club10, status: "accepted")
ClubRequest.create!(user: user19, club: club3, status: "accepted")
ClubRequest.create!(user: user23, club: club3, status: "accepted")
ClubRequest.create!(user: user24, club: club3, status: "accepted")
ClubRequest.create!(user: user25, club: club3, status: "accepted")
ClubRequest.create!(user: user27, club: club3, status: "accepted")
ClubRequest.create!(user: user29, club: club3, status: "accepted")
ClubRequest.create!(user: user30, club: club3, status: "accepted")
ClubRequest.create!(user: user31, club: club3, status: "accepted")
ClubRequest.create!(user: user32, club: club3, status: "accepted")
ClubRequest.create!(user: user50, club: club3, status: "accepted")
ClubRequest.create!(user: user33, club: club4, status: "accepted")
ClubRequest.create!(user: user34, club: club5, status: "accepted")
ClubRequest.create!(user: user35, club: club6, status: "accepted")
ClubRequest.create!(user: user36, club: club7, status: "accepted")
ClubRequest.create!(user: user37, club: club8, status: "accepted")
ClubRequest.create!(user: user38, club: club9, status: "accepted")
ClubRequest.create!(user: user39, club: club10, status: "accepted")
ClubRequest.create!(user: user40, club: club1, status: "accepted")
ClubRequest.create!(user: user41, club: club2, status: "accepted")
ClubRequest.create!(user: user42, club: club4, status: "accepted")
ClubRequest.create!(user: user43, club: club5, status: "accepted")
ClubRequest.create!(user: user44, club: club1, status: "accepted")
ClubRequest.create!(user: user45, club: club1, status: "accepted")
ClubRequest.create!(user: user46, club: club1, status: "accepted")
ClubRequest.create!(user: user47, club: club1, status: "accepted")
ClubRequest.create!(user: user48, club: club1, status: "accepted")
ClubRequest.create!(user: user49, club: club1, status: "accepted")

file = File.open(Rails.root.join('db/fixtures/users/carl.jpg'))
carl.photo.attach(io: file, filename: 'carl.jpg', content_type: 'image/png')
carl.save!

file1 = File.open(Rails.root.join('db/fixtures/users/august2.png'))
# file1 = URI.open('https://images.unsplash.com/photo-1631014611398-c6109909b66a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydGFpdHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
august.photo.attach(io: file1, filename: 'august2.png', content_type: 'image/png')
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

puts "Creating Creators"

first_creator = Creator.create!( name: "DFB", location: "Germany", description: "Germanys National Soccer Association", user: ruben)
test_supercenter = Creator.create!( name: "Supercenter", location: "Stockholm", description: "Supercenter är ett fotbollsföretag som erbjuder fotbollsträningar, kalas och turneringar på vårat center i Enebyberg. Vi på supercenter strävar efter att utveckla talanger på ett interaktivt och pedagosikt sätt!", user: ruben)
test_supercenter.save!

puts "Creating Tournaments"

tournament1 = Tournament.create!( name: "Supercenter Kuppen", rules: "Inga glidtacklingar, Starta om spelet från mållvakt och inga hemåtpassar", age_group: 10, skill_level: "Svår", description: "Välkommna till vår årliga supercenter kupp. Här har alla deltagare chans att vinna fina priser och visa upp sina skills. Var schyssta mot varandra och ha kul! Ses på supercenter(:", amount_of_teams: 8, creator: test_supercenter )
tournament1.save!

puts "Creating TournamentRequests"

TournamentRequest.create!(club: club1 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club2 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club3 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club4 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club5 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club6 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club7 , tournament: tournament1, creator: test_supercenter, status: "pending")
TournamentRequest.create!(club: club8 , tournament: tournament1, creator: test_supercenter, status: "pending")





puts "Done!"
