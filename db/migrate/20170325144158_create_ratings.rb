class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :ratingable, polymorphic: true
      t.references :user
      t.integer :amount, default: 0
      t.timestamps
    end
  end
end
