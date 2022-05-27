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

ActiveRecord::Schema[7.0].define(version: 2022_05_15_162913) do
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

  create_table "cargo_adress_loads", force: :cascade do |t|
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_cargo_adress_loads_on_customer_id"
  end

  create_table "cargo_adress_reloads", force: :cascade do |t|
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_cargo_adress_reloads_on_customer_id"
  end

  create_table "cargo_carriers", force: :cascade do |t|
    t.string "name"
    t.string "inn"
    t.string "ogrn"
    t.string "passport"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargo_cars", force: :cascade do |t|
    t.string "brand"
    t.string "reg_mark"
    t.string "p_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_cargo_cars_on_carrier_id"
  end

  create_table "cargo_contacts", force: :cascade do |t|
    t.string "tel"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.integer "customer_id"
    t.integer "driver_id"
    t.string "name_contact"
    t.index ["carrier_id"], name: "index_cargo_contacts_on_carrier_id"
    t.index ["customer_id"], name: "index_cargo_contacts_on_customer_id"
    t.index ["driver_id"], name: "index_cargo_contacts_on_driver_id"
  end

  create_table "cargo_customer_gruzs", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "gruz_id"
    t.index ["customer_id"], name: "index_cargo_customer_gruzs_on_customer_id"
    t.index ["gruz_id"], name: "index_cargo_customer_gruzs_on_gruz_id"
  end

  create_table "cargo_customer_is_cargos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargo_customers", force: :cascade do |t|
    t.string "name"
    t.string "inn"
    t.string "ogrn"
    t.string "passport"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargo_drivers", force: :cascade do |t|
    t.string "name"
    t.string "passport"
    t.string "vy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_cargo_drivers_on_carrier_id"
  end

  create_table "cargo_gruzs", force: :cascade do |t|
    t.string "weight"
    t.string "volume"
    t.string "what_is"
    t.string "g_len"
    t.string "g_wid"
    t.string "g_hei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "cargo_is_cargos", force: :cascade do |t|
    t.string "weight"
    t.string "volume"
    t.string "what_is"
    t.string "g_len"
    t.string "g_wid"
    t.string "g_hei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargo_orders", force: :cascade do |t|
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.integer "customer_id"
    t.integer "car_id"
    t.integer "driver_id"
    t.integer "town_from_id"
    t.integer "town_in_id"
    t.string "folder"
    t.integer "adress_load_id"
    t.integer "adress_reload_id"
    t.string "date_load"
    t.string "date_reload"
    t.integer "gruz_id"
    t.index ["adress_load_id"], name: "index_cargo_orders_on_adress_load_id"
    t.index ["adress_reload_id"], name: "index_cargo_orders_on_adress_reload_id"
    t.index ["car_id"], name: "index_cargo_orders_on_car_id"
    t.index ["carrier_id"], name: "index_cargo_orders_on_carrier_id"
    t.index ["customer_id"], name: "index_cargo_orders_on_customer_id"
    t.index ["driver_id"], name: "index_cargo_orders_on_driver_id"
    t.index ["gruz_id"], name: "index_cargo_orders_on_gruz_id"
    t.index ["town_from_id"], name: "index_cargo_orders_on_town_from_id"
    t.index ["town_in_id"], name: "index_cargo_orders_on_town_in_id"
  end

  create_table "cargo_payments", force: :cascade do |t|
    t.integer "sum", default: 0
    t.integer "sin", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.index ["order_id"], name: "index_cargo_payments_on_order_id"
  end

  create_table "cargo_towns", force: :cascade do |t|
    t.string "title"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
