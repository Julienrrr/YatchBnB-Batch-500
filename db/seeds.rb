# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'
require 'date'

descriptions = []
description_1 = "Si vous souhaitez découvrir notre magnifique région en famille, entre amis ou pour un événement particulier, vous venez de trouver le compagnon idéal! Disponible à la location pour la durée de votre choix (minimum une journée) ce bateau saura vous ravir quelle que soit la situation. Si vous le souhaitez, nous pouvons vous conseiller des itinéraires de navigation mais vous êtes bien entendu libre de définir ce dernier comme vous l'entendez."
descriptions << description_1
description_2 = "Possibilité de location à la journée. En juillet et août, réservations pour des locations à la journée seulement quelques jours avant la date, les locations à la semaine étant privilégiées."
descriptions << description_2
description_3 = "Nous pourrons voguer vers les incontournables de la citée phocéenne comme  le Frioul, l'archipel de Riou. Nous pourrons également longer la côte vers les Embiez, ou tirer des bords vers Carry-le-Rouet, Ensues-la-Redonne et Sausset-les-pins."
descriptions << description_3


cities = ["Marseille", "Saint-Tropez", "Barcelone", "Capri"]
boolean = [true, false]
boat_models = ["OCEANIS 31 (2011)", "QUICKSILVER — SUNDECK 675 (2013)", "JOKER BOAT — CLUBMAN 23 (2016)", "LAGOON — 400 (2011)", "SUN ODYSSEY 40.3 (2006)"]
price_per_day = [1200, 1400, 1500, 2300, 4300, 5000, 4000, 3200, 2800, 3000, 3500, 3200]
capacity = [15, 20, 25, 30, 35, 40]

rating = (1..5).to_a
content = ['Super capitaine avec une excellente connaissance de la navigation. Nous avons passé un super moment!', 'Je reviens de 3 jours de navigation avec Max5, le bateau est tres agréable et conforme à sa description. Tres bon accueil et disponibilite du propriétaire. Je recommande et louerai de nouveau ce bateau.', '', 'Très bon bateau et excellent accueil. Bonne navigation avec plus de 20 noeuds']

puts 'Creating 5O fake yachts...'
50.times do
  boat = Boat.new(
    name:           Faker::Book.title,
    user:           User.all.sample,
    boat_model:     boat_models.sample,
    description:    descriptions.sample,
    capacity:       capacity.sample,
    price_per_day:  price_per_day.sample,
    heliport:       boolean.sample,
    pool:           boolean.sample,
    spa:            boolean.sample,
    staff:          boolean.sample,
    address:        cities.sample

  )
    3.times do
      file = URI.open('https://source.unsplash.com/800x600/?yacht')
      boat.photos.attach(io: file, filename: 'boat.png', content_type: 'image/jpg')
      puts 'photo attached'
    end
    boat.save!
    puts 'boat saved'
    x = 0
    i = 1
    10.times do
      start_date = (Date.today + x)
      end_date = (start_date + i)
      puts start_date
      booking = Booking.new(
      user:       (User.all - User.where(id: boat.user.id)).sample,
      status:     'accepted',
      start_date: start_date,
      end_date:   end_date
      )
      x = x + 4
      booking.boat = boat
      booking.save!
      puts 'booking saved'
            booking.review = Review.new(
              rating:   rating.sample,
              content:  content.sample
              )
            booking.review.save!
            puts "review saved"
    end
end
puts 'Finished!'
