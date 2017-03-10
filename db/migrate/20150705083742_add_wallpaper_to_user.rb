class AddWallpaperToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallpaper, :string
  end
end
