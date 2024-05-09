require 'faker'

# Supprimer les enregistrements existants pour éviter les doublons
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Créer les utilisateurs avec des adresses e-mail @yopmail.com
users = []
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  description = Faker::Lorem.sentences(number: 2).join(' ')

  email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    description: description,
    email: email,
    password: 'password', # Utilise un mot de passe par défaut
    password_confirmation: 'password' # Confirme le mot de passe
  )

  users << user
end

# Création de quelques événements pour chaque utilisateur
users.each do |user|
  3.times do
    event = Event.create!(
      start_date: Faker::Time.forward(days: 30, period: :morning),
      duration: rand(1..6) * 5, # Durée aléatoire en multiples de 5
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 3),
      price: rand(1..1000),
      location: Faker::Address.city,
      user: user # Utilisateur associé à l'événement
    )

    # Créer une ou plusieurs "Attendance" pour cet événement
    rand(1..5).times do
      Attendance.create!(
        user: users.sample, # Utilisateur aléatoire
        event: event,
        stripe_customer_id: Faker::Alphanumeric.alpha(number: 10) # ID factice pour Stripe
      )
    end
  end
end

puts "Users, Events, & Attendances all good!"
