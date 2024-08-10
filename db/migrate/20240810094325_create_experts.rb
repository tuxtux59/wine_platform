class CreateExperts < ActiveRecord::Migration[7.1]
  def change
    create_table :experts, id: :uuid do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :encrypted_password

      t.timestamps
    end
  end
end
