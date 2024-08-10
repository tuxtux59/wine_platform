class CreateTastingNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :tasting_notes, id: :uuid do |t|
      t.references :bottle, null: false, foreign_key: true, type: :uuid
      t.references :expert, null: false, foreign_key: true, type: :uuid
      t.float :score, null: false
      t.text :details

      t.timestamps
    end
  end
end
