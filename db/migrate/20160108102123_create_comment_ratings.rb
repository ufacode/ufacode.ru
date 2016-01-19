class CreateCommentRatings < ActiveRecord::Migration
  def change
    create_table :comment_ratings do |t|
    	t.integer :user_id, index: true
      	t.integer :comment_id, index: true
      	t.integer :amount

      t.timestamps null: false
    end
  end
end

