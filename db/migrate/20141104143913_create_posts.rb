class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :image
      t.text :content
      t.text :content_cut
      t.integer :author_id, index: true
      t.timestamps
    end
  end
end
