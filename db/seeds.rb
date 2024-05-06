require 'faker'

# Créer les utilisateurs avec des adresses e-mail @yopmail.com
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  description = Faker::Lorem.sentences(number: 2).join(' ')

  email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"

  User.create!(
    first_name: first_name,
    last_name: last_name,
    description: description,
    email: email
  )
end

puts "10 utilisateurs ont été créés avec succès."
