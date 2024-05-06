require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Créer les utilisateurs avec des adresses e-mail @yopmail.com
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  description = Faker::Lorem.sentences(number: 2).join(' ')

  email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    description: description,
    email: email
  )

  # Création de quelques événements pour chaque utilisateur
  3.times do
    event = Event.create!(
      admin: user, # Utilisateur associé à l'événement
      start_date: Faker::Time.forward(days: 30, period: :morning),
      duration: rand(1..6) * 5, # Durée aléatoire en multiples de 5
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 3),
      price: rand(1..1000),
      location: Faker::Address.city
    )

    # Création de participations pour chaque événement
    rand(1..5).times do
      Attendance.create!(
        stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10),
        user: User.all.sample,
        event: event
      )
    end
  end
end



puts "utilisateurs, events, & participations ont été créés avec succès."
