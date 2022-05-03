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

ActiveRecord::Schema.define(version: 2017_08_04_014855) do

  create_table "kakeibos", charset: "utf8mb3", force: :cascade do |t|
    t.float "denki"
    t.integer "denki_cost"
    t.float "gas"
    t.integer "gas_cost"
    t.float "suidou"
    t.integer "suidou_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "month"
    t.integer "user_id"
    t.float "denki_env"
    t.float "gas_env"
    t.float "suidou_env"
    t.float "env_load"
  end

end
