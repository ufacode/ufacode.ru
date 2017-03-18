class BlogHasManyPosts < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :blog_id, :integer, index: true
  end

  def down
    remove_column :posts, :blog_id
  end
end
