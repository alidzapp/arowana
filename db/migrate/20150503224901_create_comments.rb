class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :paste
      t.string :body
      t.timestamps null: false
    end
  end
end
