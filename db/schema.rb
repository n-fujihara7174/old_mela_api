# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_28_211243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id_id", null: false
    t.bigint "post_id_id", null: false
    t.datetime "created_at", null: false
    t.index ["post_id_id"], name: "index_likes_on_post_id_id"
    t.index ["user_id_id"], name: "index_likes_on_user_id_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_user_id_id", null: false
    t.string "message_contents", limit: 240, null: false
    t.text "message_image"
    t.bigint "receiver_user_id_id", null: false
    t.boolean "is_delete", null: false
    t.datetime "created_at", null: false
    t.index ["receiver_user_id_id"], name: "index_messages_on_receiver_user_id_id"
    t.index ["sender_user_id_id"], name: "index_messages_on_sender_user_id_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id_id", null: false
    t.string "message_contents", limit: 240, null: false
    t.text "post_image"
    t.boolean "is_delete", null: false
    t.datetime "created_at", null: false
    t.index ["user_id_id"], name: "index_posts_on_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "usre_name", limit: 45, null: false
    t.string "display_user_id", limit: 45, null: false
    t.string "password", limit: 45, null: false
    t.string "self_introduction", limit: 120
    t.string "email", limit: 256, null: false
    t.integer "phone_number"
    t.date "birthday", null: false
    t.text "image"
    t.boolean "can_like_notification", null: false
    t.boolean "can_comment_notification", null: false
    t.boolean "can_message_notification", null: false
    t.boolean "can_calender_notification", null: false
    t.boolean "is_delete", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "likes", "posts", column: "post_id_id"
  add_foreign_key "likes", "users", column: "user_id_id"
  add_foreign_key "messages", "users", column: "receiver_user_id_id"
  add_foreign_key "messages", "users", column: "sender_user_id_id"
  add_foreign_key "posts", "users", column: "user_id_id"
end
