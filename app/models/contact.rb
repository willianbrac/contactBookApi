class Contact < ApplicationRecord

    # Muito para um
    belongs_to :kind

    def author
        "John Doe"
    end

    # v2
    def kind_description
        self.kind.description
    end

    def as_json(options={})
        super(
            root: true,
            # v2
            methods: [:author, :kind_description]

            # v1
            # methods: :author,

            # v1 
            # Atributos aninhados em JSON (nested attributes)
            # include: { kind: { only: :description } }
        )
end
