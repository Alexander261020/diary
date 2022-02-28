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

ActiveRecord::Schema[7.0].define(version: 2022_02_28_052254) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.bigint "chapter_id"
    t.string "content"
    t.string "comment"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_line", default: 1
    t.bigint "subsection_id"
    t.index ["chapter_id"], name: "index_blocks_on_chapter_id"
    t.index ["subsection_id"], name: "index_blocks_on_subsection_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count_clicks", default: 0
  end

  create_table "errors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsections", force: :cascade do |t|
    t.bigint "chapter_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_subsections_on_chapter_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blocks", "chapters"
  add_foreign_key "blocks", "subsections"
  add_foreign_key "subsections", "chapters"
end
