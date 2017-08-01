
ActiveRecord::Schema.define(version: 20170730173202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['slug'], name: 'index_categories_on_slug', unique: true
  end

  create_table "course_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "course_id"
    t.integer "quantity"
    t.decimal "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_orders_on_course_id"
    t.index ["order_id"], name: "index_course_orders_on_order_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.datetime "retired"
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
    t.index ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.integer 'role', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key "course_orders", "courses"
  add_foreign_key "course_orders", "orders"
  add_foreign_key "courses", "categories"
  add_foreign_key "orders", "users"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
end
