# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    user = Proponente.create({
        nome: Faker::Name.unique.name,
        cpf: Faker::CPF.numeric,
        data_nasc: Faker::Date.birthday(min_age: 18, max_age: 65),
        logradouro: Faker::Address.street_name,
        numero: Faker::Address.street_address,
        bairro: Faker::Address.secondary_address,
        cidade: Faker::Address.city,
        estado: Faker::Address.state,
        cep: Faker::Number.number(digits: 8),
        telefone_pessoal: Faker::PhoneNumber.phone_number,
        telefone_referencia: Faker::PhoneNumber.phone_number,
        salario: Faker::Number.decimal(l_digits: 4, r_digits: 2)
    })
end