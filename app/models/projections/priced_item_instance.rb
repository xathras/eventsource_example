module Projections
  class PricedItemInstance < Projection
    self.listens_for = :create_priced_item, :update_priced_item, :delete_priced_item

    def process(event_name, event_data)
      case event_name
      when :create_priced_item
        PricedItem.create(id: event_data.id, title: event_data.title,
          description: event_data.description, amount: event_data.amount,
          taxed: event_data.taxed)
      when :update_priced_item
        item = PricedItem.find(event_data.id)
        item.update_attributes(title: event_data.title, description: event_data.description,
          amount: event_data.amount, taxed: event_data.taxed)
      when :delete_priced_item
        PricedItem.find(event_data.id).update_attribute :deleted, true
      else
        raise ArgumentError, "Do not know how to process #{event_name}"
      end
    end
  end
end
