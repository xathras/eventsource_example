module Projections
  class List
    def initialize
      @internal = {}
    end

    def add(projection)
      projection.handled_events.each do |event_name|
        @internal.merge!(event_name => Array(projection)) { |key, oldval, newval|
          Array(oldval) + Array(newval)
        }
      end
      @internal
    end

    def [](event_name)
      self.for(event_name)
    end

    def for(event_name)
      @internal.fetch(event_name) {[]}
    end
  end
end
