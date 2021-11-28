class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, unique: false, limit: 4
      t.string :post_contents, null: false, limit: 250
      t.text :post_image
      t.boolean :is_delete, null: false
      t.datetime :created_at, null: false
    end
  end
end
