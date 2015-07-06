require 'rails_helper'

module Projections
  RSpec.describe List do
    it 'should let you add a projection' do
      projection = OpenStruct.new(handled_events: [:example_event])

      subject.add projection

      expect(subject[:example_event]).to include(projection)
    end

    it 'should let you add more than one projection per event name' do
      projection1 = OpenStruct.new(handled_events: [:example_event])
      projection2 = OpenStruct.new(handled_events: [:example_event])

      subject.add projection1
      subject.add projection2

      expect(subject[:example_event]).to eq [projection1, projection2]
    end
  end
end
