class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, unique: false, limit: 4
      t.integer :post_id, null: false, unique: false, limit: 4
      t.datetime :created_at, null: false
    end
  end
end
