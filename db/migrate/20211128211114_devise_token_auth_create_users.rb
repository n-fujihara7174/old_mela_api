class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table(:users) do |t|

      ##UserInfo
      t.string :name, null: false, limit: 45
      t.string :user_id, null: false, unique: true, limit: 45
      t.string :password, null: false, limit: 45
      t.string :self_introduction, limit: 120
      t.string :email, null: false,unique: true, limit: 256
      t.integer :phone_number, limit: 4
      t.date :birthday, null: false
      t.text :image
      t.boolean :can_like_notification, null: false, default: true
      t.boolean :can_comment_notification, null: false, default: true
      t.boolean :can_message_notification, null: false, default: true
      t.boolean :can_calender_notification, null: false, default: true
      t.boolean :is_delete, null: false, default: false

      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Tokens
      t.json :tokens

      #登録日
      t.datetime :created_at, null: false

      #更新日
      t.datetime :updated_at, null: false

    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
