class CreatePricedItemEvents < ActiveRecord::Migration
  def change
    create_table :priced_item_events do |t|
      t.uuid :item_id, null: false
      t.string :event_name, null: false
      t.json :data

      t.timestamps null: false
    end
  end
end
