class AddWallpaperToUser < ActiveRecord::Migration
  def change
    add_column :users, :wallpaper, :string
  end
end
