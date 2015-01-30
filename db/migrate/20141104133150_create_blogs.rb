class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string  :name
      t.text    :description
      t.string  :uri, limit: 32, index: true
      t.integer :author_id, index: true
      t.timestamps
    end
  end
end
