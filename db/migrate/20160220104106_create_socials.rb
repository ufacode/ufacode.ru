class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string  :github
      t.string  :twitter
      t.string  :skype
      t.string  :linkedin
      t.string  :vk
      t.string  :facebook
      t.string  :personal_site
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
