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

ActiveRecord::Schema.define(version: 2018_08_28_094831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caterings", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "city", null: false
    t.text "description"
    t.index ["email"], name: "index_caterings_on_email", unique: true
    t.index ["reset_password_token"], name: "index_caterings_on_reset_password_token", unique: true
  end

  create_table "daily_meals", force: :cascade do |t|
    t.date "serving_day"
    t.bigint "catering_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catering_id"], name: "index_daily_meals_on_catering_id"
    t.index ["meal_id"], name: "index_daily_meals_on_meal_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diets_ingredients", force: :cascade do |t|
    t.bigint "diet_id"
    t.bigint "ingredient_id"
    t.index ["diet_id"], name: "index_diets_ingredients_on_diet_id"
    t.index ["ingredient_id"], name: "index_diets_ingredients_on_ingredient_id"
  end

  create_table "food_requests", force: :cascade do |t|
    t.boolean "is_autorequested", default: false, null: false
    t.bigint "user_id"
    t.bigint "daily_meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_meal_id"], name: "index_food_requests_on_daily_meal_id"
    t.index ["user_id"], name: "index_food_requests_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false, unique: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "catering_id"
    t.index ["catering_id"], name: "index_meals_on_catering_id"
  end

  create_table "meals_ingredients", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "ingredient_id"
    t.index ["ingredient_id"], name: "index_meals_ingredients_on_ingredient_id"
    t.index ["meal_id"], name: "index_meals_ingredients_on_meal_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "catering_id"
    t.bigint "user_id"
    t.index ["catering_id"], name: "index_subscriptions_on_catering_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_allergies", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "user_id"
    t.index ["ingredient_id"], name: "index_users_allergies_on_ingredient_id"
    t.index ["user_id"], name: "index_users_allergies_on_user_id"
  end

  create_table "users_diets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "diet_id"
    t.index ["diet_id"], name: "index_users_diets_on_diet_id"
    t.index ["user_id"], name: "index_users_diets_on_user_id"
  end

end
