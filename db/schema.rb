
# frozen_string_literal: true


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

ActiveRecord::Schema.define(version: 20_210_808_180_355) do
  create_table 'cinema_halls', force: :cascade do |t|
    t.string 'name', null: false 
    t.integer 'capacity', null: false 
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'seats'
  end

  create_table 'screenings', force: :cascade do |t|
    t.datetime 'date', null: false 
    t.integer 'cinema_hall_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cinema_hall_id'], name: 'index_screenings_on_cinema_hall_id'
  end
end