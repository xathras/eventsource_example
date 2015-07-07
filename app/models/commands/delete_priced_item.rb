module Commands
  class DeletePricedItem
    attr_accessor :id

    def initialize(id)
      @id = id
    end

    def event_name
      :delete_priced_item
    end

    def execute
      PricedItem.transaction do
        event = PricedItemEvent.create(item_id: id, event_name: event_name, data: {})
        Projections.for(event_name).map { |projection| projection.process(event_name, self) }
      end
    end
  end
end