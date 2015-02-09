# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150209094024) do

  create_table "abilities", force: true do |t|
    t.integer  "user_id"
    t.string   "workCategory"
    t.text     "abilityContent"
    t.text     "abilityDetail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abilities", ["user_id"], name: "index_abilities_on_user_id", using: :btree

  create_table "ability_browses", force: true do |t|
    t.integer  "ability_id"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ability_browses", ["ability_id"], name: "index_ability_browses_on_ability_id", using: :btree

  create_table "ability_imgs", force: true do |t|
    t.integer  "ability_id"
    t.integer  "order"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ability_imgs", ["ability_id"], name: "index_ability_imgs_on_ability_id", using: :btree

  create_table "experiences", force: true do |t|
    t.integer  "user_id"
    t.string   "workCompany"
    t.date     "workStart"
    t.date     "workEnd"
    t.integer  "workSalary"
    t.string   "workCategory"
    t.string   "workStyle"
    t.text     "workExperience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_self_id", using: :btree

  create_table "job_browses", force: true do |t|
    t.integer  "job_id"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_browses", ["job_id"], name: "index_job_browses_on_job_id", using: :btree

  create_table "job_imgs", force: true do |t|
    t.integer  "job_id"
    t.integer  "order"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_imgs", ["job_id"], name: "index_job_imgs_on_job_id", using: :btree

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.string   "workCategory"
    t.text     "jobContent"
    t.text     "jobDetail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "selves", force: true do |t|
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "name"
    t.string   "cellphone"
    t.string   "sex"
    t.date     "birth"
    t.string   "marriage"
    t.string   "workStatus"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "selves", ["user_id"], name: "index_selves_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
