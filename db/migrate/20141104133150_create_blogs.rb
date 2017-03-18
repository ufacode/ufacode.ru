class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string  :name
      t.text    :description
      t.string  :uri, index: true
      t.integer :author_id, index: true
      t.timestamps
    end
  end
end
