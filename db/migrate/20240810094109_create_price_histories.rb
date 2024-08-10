class CreatePriceHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :price_histories, id: :uuid do |t|
      t.float :price, null: false
      t.datetime :recorded_at, null: false
      t.references :bottle, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
