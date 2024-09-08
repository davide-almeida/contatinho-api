# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Creating users...'
User.create!(email: 'davide@teste.com.br', password: 'asdasd', password_confirmation: 'asdasd')
puts 'Users created successfully!'

puts 'Creating contacts...'
Contact.create!(name: 'Contato 1', cpf_code: '025.274.010-66', user: User.find_by(email: 'davide@teste.com.br'))
puts 'Contacts created successfully!'

puts 'Creating phones...'
Phone.create!(number: '999999999', contact: Contact.first)
puts 'Phones created successfully!'

puts 'Creating addresses...'
Address.create!(
  street: 'Rua 1',
  number: '123',
  neighborhood: 'Bairro 1',
  city: 'São Paulo',
  state: 'SP',
  zip_code: '12345-678',
  country: 'Brasil',
  latitude: -23.5505199,
  longitude: -46.63330939999999,
  contact: Contact.first
)
puts 'Addresses created successfully!'
