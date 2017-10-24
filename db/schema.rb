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

ActiveRecord::Schema.define(version: 20171012065802) do

  create_table "cuisines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "genre"
    t.string "name"
    t.integer "calorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodstuffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "food"
    t.string "amount"
    t.integer "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kakeibos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "denki", limit: 24
    t.integer "denki_cost"
    t.float "gas", limit: 24
    t.integer "gas_cost"
    t.float "suidou", limit: 24
    t.integer "suidou_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "month"
    t.integer "user_id"
    t.float "denki_env", limit: 24
    t.float "gas_env", limit: 24
    t.float "suidou_env", limit: 24
    t.float "env_load", limit: 24
  end

  create_table "meals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cuisine_id"
    t.integer "user_id"
    t.float "foodmileage", limit: 24
    t.float "virtualwater", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "gyu_vw", limit: 24
    t.float "gyu_fm", limit: 24
    t.float "buta_vw", limit: 24
    t.float "buta_fm", limit: 24
    t.float "tori_vw", limit: 24
    t.float "tori_fm", limit: 24
    t.float "tamago_vw", limit: 24
    t.float "tamago_fm", limit: 24
    t.float "kome_vw", limit: 24
    t.float "kome_fm", limit: 24
    t.float "gohan_vw", limit: 24
    t.float "gohan_fm", limit: 24
    t.float "pan_vw", limit: 24
    t.float "pan_fm", limit: 24
    t.float "udon_vw", limit: 24
    t.float "udon_fm", limit: 24
    t.float "soumen_vw", limit: 24
    t.float "soumen_fm", limit: 24
    t.float "soba_vw", limit: 24
    t.float "soba_fm", limit: 24
    t.float "supagety_vw", limit: 24
    t.float "supagety_fm", limit: 24
    t.float "ramen_vw", limit: 24
    t.float "ramen_fm", limit: 24
    t.float "daikon_vw", limit: 24
    t.float "daikon_fm", limit: 24
    t.float "kabu_vw", limit: 24
    t.float "kabu_fm", limit: 24
    t.float "ninjin_vw", limit: 24
    t.float "ninjin_fm", limit: 24
    t.float "gobou_vw", limit: 24
    t.float "gobou_fm", limit: 24
    t.float "renkon_vw", limit: 24
    t.float "renkon_fm", limit: 24
    t.float "satoimo_vw", limit: 24
    t.float "satoimo_fm", limit: 24
    t.float "yamaimo_vw", limit: 24
    t.float "yamaimo_fm", limit: 24
    t.float "hakusai_vw", limit: 24
    t.float "hakusai_fm", limit: 24
    t.float "kyabetsu_vw", limit: 24
    t.float "kyabetsu_fm", limit: 24
    t.float "hourensou_vw", limit: 24
    t.float "hourensou_fm", limit: 24
    t.float "negi_vw", limit: 24
    t.float "negi_fm", limit: 24
    t.float "tamanegi_vw", limit: 24
    t.float "tamanegi_fm", limit: 24
    t.float "nasu_vw", limit: 24
    t.float "nasu_fm", limit: 24
    t.float "tomato_vw", limit: 24
    t.float "tomato_fm", limit: 24
    t.float "kyuri_vw", limit: 24
    t.float "kyuri_fm", limit: 24
    t.float "kabotya_vw", limit: 24
    t.float "kabotya_fm", limit: 24
    t.float "pyman_vw", limit: 24
    t.float "pyman_fm", limit: 24
    t.float "endou_vw", limit: 24
    t.float "endou_fm", limit: 24
    t.float "edamame_vw", limit: 24
    t.float "edamame_fm", limit: 24
    t.float "ingen_vw", limit: 24
    t.float "ingen_fm", limit: 24
    t.float "tomorokoshi_vw", limit: 24
    t.float "tomorokoshi_fm", limit: 24
    t.float "retasu_vw", limit: 24
    t.float "retasu_fm", limit: 24
    t.float "serori_vw", limit: 24
    t.float "serori_fm", limit: 24
    t.float "karifura_vw", limit: 24
    t.float "karifura_fm", limit: 24
    t.float "buro_vw", limit: 24
    t.float "buro_fm", limit: 24
    t.float "jaga_vw", limit: 24
    t.float "jaga_fm", limit: 24
    t.float "satsumaimo_vw", limit: 24
    t.float "satsumaimo_fm", limit: 24
    t.float "ninniku_vw", limit: 24
    t.float "ninniku_fm", limit: 24
    t.float "shitake_vw", limit: 24
    t.float "shitake_fm", limit: 24
    t.float "kuri_vw", limit: 24
    t.float "kuri_fm", limit: 24
    t.float "daizu_vw", limit: 24
    t.float "daizu_fm", limit: 24
    t.float "mikan_vw", limit: 24
    t.float "mikan_fm", limit: 24
    t.float "kiui_vw", limit: 24
    t.float "kiui_fm", limit: 24
    t.float "orange_vw", limit: 24
    t.float "orange_fm", limit: 24
    t.float "ringo_vw", limit: 24
    t.float "ringo_fm", limit: 24
    t.float "budou_vw", limit: 24
    t.float "budou_fm", limit: 24
    t.float "nashi_vw", limit: 24
    t.float "nashi_fm", limit: 24
    t.float "momo_vw", limit: 24
    t.float "momo_fm", limit: 24
    t.float "sumomo_vw", limit: 24
    t.float "sumomo_fm", limit: 24
    t.float "pain_vw", limit: 24
    t.float "pain_fm", limit: 24
    t.float "sakura_vw", limit: 24
    t.float "sakura_fm", limit: 24
    t.float "kaki_vw", limit: 24
    t.float "kaki_fm", limit: 24
    t.float "ichigo_vw", limit: 24
    t.float "ichigo_fm", limit: 24
    t.float "suika_vw", limit: 24
    t.float "suika_fm", limit: 24
    t.float "meron_vw", limit: 24
    t.float "meron_fm", limit: 24
    t.float "touhu_vw", limit: 24
    t.float "touhu_fm", limit: 24
    t.float "konnyaku_vw", limit: 24
    t.float "konnyaku_fm", limit: 24
    t.float "bata_vw", limit: 24
    t.float "bata_fm", limit: 24
    t.float "yoogle_vw", limit: 24
    t.float "yoogle_fm", limit: 24
    t.float "cheese_vw", limit: 24
    t.float "cheese_fm", limit: 24
    t.float "gyunyu_vw", limit: 24
    t.float "gyunyu_fm", limit: 24
    t.float "v_vw", limit: 24
    t.float "v_fm", limit: 24
    t.float "sio_vw", limit: 24
    t.float "sio_fm", limit: 24
    t.float "syoyu_vw", limit: 24
    t.float "syoyu_fm", limit: 24
    t.float "sake_vw", limit: 24
    t.float "sake_fm", limit: 24
    t.float "miso_vw", limit: 24
    t.float "miso_fm", limit: 24
    t.float "kecha_vw", limit: 24
    t.float "kecha_fm", limit: 24
    t.float "kosyo_vw", limit: 24
    t.float "kosyo_fm", limit: 24
    t.float "kary_vw", limit: 24
    t.float "kary_fm", limit: 24
    t.float "komugi_vw", limit: 24
    t.float "komugi_fm", limit: 24
    t.float "satou_vw", limit: 24
    t.float "satou_fm", limit: 24
    t.float "su_vw", limit: 24
    t.float "su_fm", limit: 24
    t.float "syokubutsuyu_vw", limit: 24
    t.float "syokubutsuyu_fm", limit: 24
    t.float "oliveoil_vw", limit: 24
    t.float "oliveoil_fm", limit: 24
    t.float "tya_vw", limit: 24
    t.float "tya_fm", limit: 24
    t.float "mugitya_vw", limit: 24
    t.float "mugitya_fm", limit: 24
    t.float "tea_vw", limit: 24
    t.float "tea_fm", limit: 24
    t.float "coffee_vw", limit: 24
    t.float "coffee_fm", limit: 24
    t.float "orangejuce_vw", limit: 24
    t.float "orangejuce_fm", limit: 24
    t.float "lemonjuce_vw", limit: 24
    t.float "lemonjuce_fm", limit: 24
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "setai"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
