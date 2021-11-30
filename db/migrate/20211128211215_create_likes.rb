class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :post, null: false, foreign_key: {to_table: :posts}
      t.datetime :created_at, null: false
    end
  end
end
