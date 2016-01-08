class CreatePostRatings < ActiveRecord::Migration
  def change
    create_table :post_ratings do |t|
      t.integer :user_id, index: true
      t.integer :post_id, index: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end

