class AddAnnouncementToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :announcement, :boolean
  end
end
