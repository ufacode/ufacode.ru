class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :social
      t.timestamps null: false
    end
  end
end
