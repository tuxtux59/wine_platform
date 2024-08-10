class CreateSavedSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_searches, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.jsonb :search_params, null: false, default: '{}'

      t.timestamps
    end
  end
end
