module Projections
  class Projection
    def self.listens_for
      @listens_for ||= []
    end

    def self.listens_for=(*event_names)
      @listens_for ||= []
      @listens_for += Array(event_names)
    end

    def process(event_name, event_data)
      raise NotImplementedError, 'Subclasses must implement #process themselves'
    end

    def handled_events
      self.class.listens_for
    end
  end
end
