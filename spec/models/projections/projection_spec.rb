require 'rails_helper'

module Projections
  RSpec.describe Projection do
    it 'should not let you call process' do
      expect { subject.process :test, 'data' }.to raise_error NotImplementedError
    end
  end
end
