namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    # Populate Kinds
    puts "Cadastrando tipos de contatos..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de contatos cadastrados com sucesso!"

    # Populate contacts
    puts "Cadastrando contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1979-09-23', to: '2000-09-25'),
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados com sucesso!"

  end
end
