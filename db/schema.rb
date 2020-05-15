# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_15_005507) do

  create_table "action_text_rich_texts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", limit: 16777215
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.bigint "creator_id"
    t.string "creator_name"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_comments_on_content_id"
    t.index ["creator_id"], name: "index_comments_on_creator_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "content_perks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "content_id"
    t.bigint "perk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_content_perks_on_content_id"
    t.index ["perk_id"], name: "index_content_perks_on_perk_id"
  end

  create_table "contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", default: ""
    t.string "image_title", default: ""
    t.text "image_description"
    t.string "video"
    t.string "video_url"
    t.string "thumbnail"
    t.string "video_title"
    t.text "video_description"
    t.string "audio"
    t.string "audio_image"
    t.string "audio_title"
    t.text "audio_description"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_contents_on_creator_id"
  end

  create_table "creators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "podcasts", default: false
    t.boolean "videos", default: false
    t.boolean "music", default: false
    t.string "creator_name", default: ""
    t.string "creator_email", default: ""
    t.integer "restriction", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "cover_image"
    t.string "video"
    t.text "description"
    t.string "thumbnail"
    t.integer "dm_permission", default: 1
    t.index ["creator_name"], name: "index_creators_on_creator_name"
    t.index ["user_id"], name: "index_creators_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.bigint "creator_id"
    t.boolean "is_user"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_messages_on_creator_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "perks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "amount", precision: 8, default: "0", null: false
    t.text "description"
    t.string "image"
    t.bigint "creator_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_donational_amount", default: 0
    t.string "status", default: "active"
    t.integer "backings_count", default: 0
    t.index ["creator_id"], name: "index_perks_on_creator_id"
    t.index ["user_id"], name: "index_perks_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_rooms_on_creator_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "talents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_talents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_talents_on_reset_password_token", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "uid"
    t.string "provider"
    t.string "access_code"
    t.string "publishable_key"
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.boolean "subscribed"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.string "card_type"
    t.text "perk_subscriptions"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "contents"
  add_foreign_key "comments", "creators"
  add_foreign_key "comments", "users"
  add_foreign_key "content_perks", "contents"
  add_foreign_key "content_perks", "perks"
  add_foreign_key "contents", "creators"
  add_foreign_key "creators", "users"
  add_foreign_key "messages", "creators"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "perks", "creators"
  add_foreign_key "perks", "users"
  add_foreign_key "rooms", "creators"
  add_foreign_key "rooms", "users"
end
