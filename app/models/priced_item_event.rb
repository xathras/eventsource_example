class PricedItemEvent < ActiveRecord::Base
  %i[title description amount taxed].each do |attr_name|
    define_method attr_name do
      data[attr_name]
    end
  end
end
