require 'rails_helper'

module Projections
  RSpec.describe PricedItemInstance do
    it 'should create a new PricedItem' do
      subject.process :create_priced_item, OpenStruct.new(id: SecureRandom.uuid,
        title: 'test title', description: 'test description', amount: 10.00,
        taxed: false)

      expect(PricedItem.count).to eq 1
    end
  end
end
