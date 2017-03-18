class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.references :user, index: true
      t.string :name
      t.string :uid

      t.timestamps null: false
    end
    add_foreign_key :providers, :users
  end
end
