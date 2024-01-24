class Contact < ApplicationRecord

    # Muito para um
    # Uma categoria pode ter muitos contatos
    belongs_to :kind

    # Um para muitos
    # Um contato pode ter muitos telefones
    has_many :phones

    # um para um
    # Um contato pode ter um endereço
    has_one :address

    # Atributos aninhados (nested attributes)
    # Cadastra os telefones aninhados com o contato
    accepts_nested_attributes_for :phones, allow_destroy: true

    # Cadastra o endereço aninhado com o contato
    accepts_nested_attributes_for :address, update_only: true

    # formatação da data de nascimento para o formato brasileiro
    def as_json(options={})
        hash = super(options)

        # Faz a formatação se a data de nascimento não estiver vazia
        hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        
        hash
    end

    # # v2
    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         root: true,
    #         # v2
    #         methods: [:author, :kind_description]

    #         # v1
    #         # methods: :author,

    #         # v1 
    #         # Atributos aninhados em JSON (nested attributes)
    #         # include: { kind: { only: :description } }
    #     )
end
