class CreateUserRoleGrants < ActiveRecord::Migration[6.1]
  def change
    create_table :user_role_grants do |t|
      t.references :user, foreign_key: {to_table: :users}, null: false
      t.references :role, foreign_key: {to_table: :roles}, null: false
      t.timestamps

      t.index [:user_id, :role_id], unique: true
    end
  end
end
