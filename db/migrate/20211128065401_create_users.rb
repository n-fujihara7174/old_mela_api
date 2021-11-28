class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :usre_name, null: false, limit: 45
      t.string :display_user_id, null: false, unique: true, limit: 45
      t.string :password, null: false, limit: 45
      t.string :self_introduction, limit: 120
      t.string :email, null: false,unique: true, limit: 256
      t.integer :phone_number, limit: 4
      t.date :birthday, null: false
      t.text :image
      t.boolean :can_like_notification, null: false
      t.boolean :can_comment_notification, null: false
      t.boolean :can_message_notification, null: false
      t.boolean :can_calender_notification, null: false
      t.boolean :is_delete, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
