class AddWallpaperToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wallpaper, :string
  end
end
