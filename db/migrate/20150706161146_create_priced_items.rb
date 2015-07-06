class CreatePricedItems < ActiveRecord::Migration
  def change
    create_table :priced_items, id: :uuid do |t|
      t.text :title
      t.text :description
      t.decimal :amount, precision: 8, scale: 2, default: 0.0, null: false
      t.boolean :taxed, default: false, null: false
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end
