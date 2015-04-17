class RenameAuthorIdToUserIdEverywhere < ActiveRecord::Migration
  def up
    rename_column :posts, :author_id, :user_id
    rename_column :blogs, :author_id, :user_id
  end
  def down
    rename_column :posts, :user_id, :author_id
    rename_column :blogs, :user_id, :author_id
  end
end
