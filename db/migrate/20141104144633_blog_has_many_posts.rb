class BlogHasManyPosts < ActiveRecord::Migration
  def up
    add_column :posts, :blog_id, :integer, index: true
  end

  def down
    remove_column :posts, :blog_id
  end
end
