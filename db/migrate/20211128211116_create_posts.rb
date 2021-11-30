class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.string :message_contents, null: false, limit: 240
      t.text :post_image
      t.boolean :is_delete, null: false
      t.datetime :created_at, null: false
    end
  end
end
