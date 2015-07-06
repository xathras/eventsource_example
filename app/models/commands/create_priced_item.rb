module Commands
  class CreatePricedItem
    include ActiveModel::Model

    attr_accessor :title, :description, :amount, :taxed
    validates :title, :description, :amount, presence: true

    def event_name
      :create_priced_item
    end

    def id
      @id ||= SecureRandom.uuid
    end

    def execute
      event = PricedItemEvent.create(item_id: id, event_name: event_name, data: json_attrs)
      Projections.for(event_name).map { |projection| projection.process(event_name, event) }
    end

  private
    def json_attrs
      {
        title: title,
        description: description,
        amount: amount,
        taxed: taxed
      }
    end
  end
end
