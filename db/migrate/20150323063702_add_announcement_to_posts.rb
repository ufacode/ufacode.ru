class AddAnnouncementToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :announcement, :boolean
  end
end
