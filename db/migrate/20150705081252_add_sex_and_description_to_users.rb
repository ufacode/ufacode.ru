class AddSexAndDescriptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :integer, default: 1, limit: 1
    add_column :users, :description, :text
  end
end
