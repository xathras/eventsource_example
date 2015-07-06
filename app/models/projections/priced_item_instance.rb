module Projections
  class PricedItemInstance < Projection
    self.listens_for = :create_priced_item

    def process(event_name, event_data)
      case event_name
      when :create_priced_item
        PricedItem.create(id: event_data.id, title: event_data.title,
          description: event_data.description, amount: event_data.amount,
          taxed: event_data.taxed)
      else
        raise ArgumentError, "Do not know how to process #{event_name}"
      end
    end
  end
end
