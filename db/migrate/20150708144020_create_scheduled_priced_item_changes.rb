class CreateScheduledPricedItemChanges < ActiveRecord::Migration
  def change
    create_table :scheduled_priced_item_changes do |t|
      t.uuid :item_id
      t.datetime :effective_date
      t.text :title
      t.text :description
      t.decimal :amount, precision: 8, scale: 2, default: 0.0, null: false
      t.boolean :taxed, null: false, default: false

      t.timestamps null: false
    end
  end
end
