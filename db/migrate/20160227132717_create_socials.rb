class CreateSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :socials do |t|
    	t.integer :user_id, index: true
    	t.string  :name
    	t.string  :value

      t.timestamps null: false
    end
  end
end
