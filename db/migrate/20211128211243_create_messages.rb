class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :sender_user_id, null: false, unique: false, limit: 4
      t.string :message_contents, null: false, limit: 240
      t.text :message_image
      t.integer :receiver_user_id, null: false, unique: false, limit: 4
      t.boolean :is_delete, null: false
      t.datetime :created_at, null: false
    end
  end
end
