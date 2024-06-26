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

ActiveRecord::Schema[7.0].define(version: 2022_07_19_025724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "product_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_plan_id"], name: "index_customers_on_product_plan_id"
  end

  create_table "customers_users", id: false, force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "user_id", null: false
    t.index ["customer_id"], name: "index_customers_users_on_customer_id"
    t.index ["user_id"], name: "index_customers_users_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "winner_id", null: false
    t.integer "winner_score", null: false
    t.bigint "loser_id", null: false
    t.integer "loser_score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "league_id"
    t.index ["league_id"], name: "index_games_on_league_id"
    t.index ["loser_id"], name: "index_games_on_loser_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "customer_id", null: false
    t.bigint "sport_id", null: false
    t.index ["customer_id"], name: "index_leagues_on_customer_id"
    t.index ["sport_id"], name: "index_leagues_on_sport_id"
  end

  create_table "product_plans", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "sport_elo_ratings", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sport_id", null: false
    t.integer "elo_rating", null: false
    t.index ["sport_id"], name: "index_sport_elo_ratings_on_sport_id"
    t.index ["user_id"], name: "index_sport_elo_ratings_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "product_plans"
  add_foreign_key "games", "leagues"
  add_foreign_key "games", "users", column: "loser_id"
  add_foreign_key "games", "users", column: "winner_id"
  add_foreign_key "leagues", "customers"
  add_foreign_key "leagues", "sports"
  add_foreign_key "sport_elo_ratings", "sports"
  add_foreign_key "sport_elo_ratings", "users"
end
