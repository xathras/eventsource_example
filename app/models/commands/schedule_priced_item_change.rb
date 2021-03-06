module Commands
  class SchedulePricedItemChange
    include ActiveModel::Model

    attr_accessor :id, :title, :description, :amount, :taxed, :effective_date
    validates :id, :title, :description, :amount, :effective_date,
              presence: true

    def event_name
      :schedule_priced_item_change
    end

    def persisted?
      false
    end

    def execute
      PricedItem.transaction do
        event = PricedItemEvent.create(item_id: id, event_name: event_name, data: json_attrs)
        Projections.for(event_name).map { |projection| projection.process(event_name, OpenStruct.new(json_attrs)) }
      end
    end

  private
    def json_attrs
      {
        id: id,
        title: title,
        description: description,
        amount: amount,
        taxed: taxed,
        effective_date: effective_date
      }
    end
  end
end
