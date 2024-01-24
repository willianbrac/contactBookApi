namespace :dev do
  desc "Configura o ambiente de desenvolvimento"

  task setup: :environment do

  %x(rails db:drop:_unsafe db:create:all db:migrate)

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

    # Populate Phones
    puts "Cadastrando telefones..."

    # Itera cada contato e atribui uma quantidade aleatória de no máximo 5 telefones 
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        # A partir do Rails 5 é obrigatório campos relacionados serem preenchidos
        contact.phones.create!(
          number:Faker::PhoneNumber.cell_phone
        )
        contact.save!
      end
    end

    puts "Telefones cadastrados com sucesso!"

    # Populate Address
    puts "Cadastrando endereços..."
 
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços cadastrados com sucesso!"

  end
end
