class CreateBottles < ActiveRecord::Migration[7.1]
  def change
    create_table :bottles, id: :uuid do |t|
      t.string :name, null: false
      t.string :grape_variety, null: false
      t.string :vintage
      t.string :sale_url, null: false
      t.string :thumb, default: "https://mockupfree.net/wp-content/uploads/2022/08/wine-bottle-scaled.jpg"

      t.timestamps
    end
  end
end
