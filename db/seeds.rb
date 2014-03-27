# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Salon.create(name: "Wonderful Hair salon", address: "1 5th Ave, New York, NY", photo_url: "http://retaildesignblog.net/wp-content/uploads/2012/08/Vinyls-Mix-hair-salon-by-SIDES-CORE-Japan.jpg", phone_number: "1234567890")

Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261")

Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")
