module Projections
  class Projection
    def self.handled_events
      @handled_events ||= []
    end

    def self.register_for(*event_names)
      @handled_events = event_names
      Projections.add new
    end

    def process(event_name, event_data)
      raise NotImplementedError, 'Subclasses must implement #process themselves'
    end

    def handled_events
      self.class.handled_events
    end
  end
end
