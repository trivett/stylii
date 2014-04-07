#### Soon to come: Loop through the Yelp API to get a bunch of phone numbers

Stylist.create(salon_id: 1, name: "Ron", birthdate: Date.new(1958,04,04), male_price: 40, female_price: 60, specialty: "jerry curls", photo_url: "http://images4.mtv.com/uri/mgid:file:docroot:mtv.com:/shared/media/images/amg_artist_portraits/standard/drp000/p049/p04913l4n44.jpg?enlarge=false&matte=true&matteColor=black&quality=0.85", email: "ron@gmail.com", rating_average: nil, starts_work_at: "4:00 a.m.", ends_work_at: "2:00 p.m.", day_off: "Sunday", password: "abcd", password_confirmation: "abcd")
Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

Appointment.create(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at noon")

Client.create(name: "McKenneth", photo_url: "http://farm4.staticflickr.com/3807/11836537024_1137e50ff1_o.jpg", birthdate: Date.new(1987,05,12), gender: "male", phone_number: "6465156224", email: "mckenneth@gmail.com", password: "abcd", password_confirmation: "abcd")

Client.create(name: "Natalie", photo_url: "http://www.celebhairdo.com/wp-content/uploads/2014/02/natalie.jpg", birthdate: Date.new(1927,03,11), gender: "female", phone_number: "2125156324", email: "natalie@gmail.com", password: "abcd", password_confirmation: "abcd")



Salon.create(:phone_number => "2123672123")
Salon.create(:phone_number => "2129891807")
Salon.create(:phone_number => "2126886498")
Salon.create(:phone_number => "2122262600")
Salon.create(:phone_number => "2123343777")
Salon.create(:phone_number => "2122651700")
Salon.create(:phone_number => "7187828376")






Stylist.create(salon_id: 2, name: "Mike", birthdate: Date.new(1968,04,04), male_price: 40, female_price: 100, specialty: "face tattos", photo_url: "http://www.yourblackworld.net/wp-content/uploads/2013/04/30/mike-tyson.jpeg", email: "mike@gmail.com", rating_average: nil, starts_work_at: "12:00 a.m.", ends_work_at: "5:00 a.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")


Stylist.create(salon_id: 2, name: "Shaggy", birthdate: Date.new(1954,04,04), male_price: 40, female_price: 60, specialty: "nothing", photo_url: "http://upload.wikimedia.org/wikipedia/en/3/31/Shaggy11.jpg", email: "shaggy@gmail.com", rating_average: nil, starts_work_at: "12:00 p.m.", ends_work_at: "3:00 p.m.", day_off: "Wednesday", password: "abcd", password_confirmation: "abcd")

Stylist.create(salon_id: 2, name: "Scarlett", birthdate: Date.new(1985,12,04), male_price: 40, female_price: 60, specialty: "incredibleness", photo_url: "http://www.myfilmviews.com/wp-content/uploads/2012/12/scarlett_johansson.jpg", email: "scarlett@gmail.com", rating_average: nil, starts_work_at: "1:00 p.m.", ends_work_at: "9:00 p.m.", day_off: "Thursday", password: "abcd", password_confirmation: "abcd")

Stylist.create(salon_id: 3, name: "Zach", birthdate: Date.new(1975,11,16), male_price: 40, female_price: 1, specialty: "beards", photo_url: "http://big.assets.huffingtonpost.com/zach.gif", email: "zach@gmail.com", rating_average: nil, starts_work_at: "2:00 p.m.", ends_work_at: "5:00 p.m.", day_off: "Friday", password: "abcd", password_confirmation: "abcd")



