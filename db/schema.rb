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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_160726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "gender", default: 0, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.date "birthdate"
    t.string "place_of_birth"
    t.integer "height"
    t.float "current_weight"
    t.float "weight_six_month_ago"
    t.float "weight_one_year_ago"
    t.boolean "weight_change", default: false, null: false
    t.string "weight_goal"
    t.string "address"
    t.string "occupation"
    t.integer "hours_of_work_per_week"
    t.integer "relationship_status", default: 0, null: false
    t.string "children"
    t.string "pets"
    t.text "health_concerns"
    t.text "other_concerns_or_goals"
    t.string "best_point_in_life"
    t.string "health_of_mother"
    t.string "health_of_father"
    t.string "sleep_condition"
    t.integer "hours_of_sleep"
    t.boolean "wake_up_at_night", default: false, null: false
    t.text "wake_up_at_night_reason"
    t.boolean "serious_illnesses", default: false, null: false
    t.boolean "pain_stiffness_or_swelling", default: false, null: false
    t.boolean "constipation_diarrhea_or_gas", default: false, null: false
    t.boolean "allergies_or_sensitivities", default: false, null: false
    t.text "allergies_or_sensitivities_explanation"
    t.text "breakfast"
    t.text "lunch"
    t.text "dinner"
    t.text "snacks"
    t.text "liquids"
    t.boolean "support_from_family", default: false, null: false
    t.boolean "cooks", default: false, null: false
    t.integer "home_cooked_percentage"
    t.boolean "craving_sugar_cigarettes_or_addictions", default: false, null: false
    t.text "most_important_improvements"
    t.text "additional_comment"
    t.boolean "regular_periods", default: false, null: false
    t.integer "flow_days"
    t.string "frequency"
    t.boolean "painful_or_symptomatic", default: false, null: false
    t.text "painful_or_symptomatic_explanation"
    t.boolean "reached_or_approaching_menopause", default: false, null: false
    t.text "birth_control_history"
    t.boolean "yeast_infection_or_urinary_tract_infections", default: false, null: false
    t.text "yeast_infection_or_urinary_tract_infections_explanation"
    t.boolean "supplements_or_medications", default: false, null: false
    t.text "supplements_or_medications_list"
    t.boolean "healers_helpers_or_therapies", default: false, null: false
    t.text "healers_helpers_or_therapies_list"
    t.text "role_of_sports"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["token"], name: "index_contacts_on_token", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_instructions_on_recipe_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "session_count"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category", default: 0, null: false
    t.string "prep_time"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "locked_website_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "instructions", "recipes"
end
