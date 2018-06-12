# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name:"Laura", last_name: "Campbell", username:"lauraelizabethc", email: "campbell.laura.elizabeth@gmail.com", password: "flatiron")

User.create(first_name:"Carolyn", last_name: "Campbell", username:
"carolynmichelle", email: "ccampbell@gmail.com", password: "threedegrees")

Trip.create(user_id: 1, name: "Summer 2018", origin: "NYC", destination: "LA", departure_date: '2018-06-29', return_date: '2018-07-11', slug: 'summer-2018')

Trip.create(user_id: 2, name: "South America 2018", origin: "SFO", destination: "MIA", departure_date: '2018-09-15', return_date: '2018-09-30', slug: 'south-america-2018')

Trip.create(user_id: 1, name: "Iceland 2018", origin: "LAX", destination: "JFK", departure_date: '2018-08-10', return_date: '2018-08-15', slug: 'iceland-2018')
