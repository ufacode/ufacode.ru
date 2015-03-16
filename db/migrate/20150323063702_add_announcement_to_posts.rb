class AddAnnouncementToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :announcement, :boolean
  end
end
