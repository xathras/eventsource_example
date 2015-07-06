module Projections
  def self.list
    @list ||= List.new
  end

  def self.for(event_name)
    list.for(event_name)
  end

  def self.add(projection)
    list.add(projection)
  end

  def self.[](event_name)
    list[event_name]
  end
end
