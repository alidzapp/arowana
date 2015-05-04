class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.integer :language, default: 0
      t.datetime :expires_at
      t.string :name
      t.references :user
      t.string :body
      t.timestamps null: false
    end
  end
end
