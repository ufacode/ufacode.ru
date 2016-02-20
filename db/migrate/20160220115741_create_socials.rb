class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
    	t.string  :name
    	t.text    :value
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
