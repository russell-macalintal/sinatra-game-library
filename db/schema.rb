# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_28_202659) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "console_users", force: :cascade do |t|
    t.integer "console_id"
    t.integer "user_id"
  end

  create_table "consoles", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer"
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
  end

  create_table "game_users", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.integer "developer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
