class AddRatingToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :likes,    :integer, default: 0
  	add_column :comments, :dislikes, :integer, default: 0
  	add_column :comments, :rating,   :integer, default: 0, index: true
  end
end
