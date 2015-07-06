namespace :app do
  desc "Process All events from the beginning of timestamps"
  task :reprocess_all => [:environment] do
    PricedItem.delete_all
    PricedItemEvent.find_each do |event|
      Projections.for(event.event_name.to_sym).map { |projection| projection.process(event.event_name.to_sym, OpenStruct.new(event.data.merge(id: event.item_id)) ) }
    end
  end
end
