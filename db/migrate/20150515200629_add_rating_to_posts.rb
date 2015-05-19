class AddRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes,    :integer, default: 0
    add_column :posts, :dislikes, :integer, default: 0
    add_column :posts, :rating,   :integer, default: 0, index: true
  end
end
