class ResetMigration < ActiveRecord::Migration[6.0]
  # These are extensions that must be enabled in order to support this database

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "admin_type"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.integer "from_user_id"
    t.integer "target_user_id"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_notifications_on_from_user_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["target_user_id"], name: "index_notifications_on_target_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "amount"
    t.string "stripe_price_id"
    t.string "identified_char"
    t.string "priceable_type"
    t.bigint "priceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["priceable_type", "priceable_id"], name: "index_prices_on_priceable_type_and_priceable_id"
  end

  create_table "social_profiles", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.string "access_secret"
    t.text "credentials"
    t.text "raw_info"
    t.text "description"
    t.string "refresh_token"
    t.string "account_id"
    t.string "pmi"
    t.string "personal_meeting_url"
    t.string "vanity_url"
    t.datetime "access_token_expires_at"
    t.index ["user_id"], name: "index_social_profiles_on_user_id"
  end

  create_table "stripe_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "access_token"
    t.boolean "livemode"
    t.string "refresh_token"
    t.string "token_type"
    t.string "stripe_publishable_key"
    t.string "stripe_user_id"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_stripe_accounts_on_instructor_id"
    t.index ["user_id"], name: "index_stripe_accounts_on_user_id"
  end

  create_table "stripe_charge_histories", force: :cascade do |t|
    t.string "charge_id"
    t.bigint "destination_user_id"
    t.integer "amount"
    t.string "currency"
    t.string "customer_id"
    t.string "destination"
    t.string "balance_transaction"
    t.integer "application_fee_amount"
    t.string "application_fee_id"
    t.bigint "stripe_payment_history_id"
    t.string "receipt_url"
    t.string "payment_intent_id"
    t.string "transfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stripe_payment_histories", force: :cascade do |t|
    t.integer "product_type"
    t.bigint "user_id"
    t.integer "status"
    t.string "customer_id"
    t.string "stripe_price_id"
    t.string "product_id"
    t.string "subscription_id"
    t.string "invoice_id"
    t.string "invoice_url"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_id"
    t.string "payment_intent_id"
    t.boolean "is_captured", default: false
    t.boolean "is_transferred", default: false
    t.integer "stripe_session_id"
    t.datetime "captured_at"
    t.datetime "transferred_at"
    t.datetime "canceled_at"
    t.datetime "refunded_at"
    t.boolean "is_refunded", default: false
    t.boolean "is_canceled", default: false
    t.float "commission_rate"
    t.float "refund_rate"
    t.integer "refund_type", default: 0
    t.integer "refunded_amount"
    t.integer "captured_amount"
    t.integer "transferred_amount"
    t.integer "platform_commission_amount"
    t.integer "stripe_payout_history_id"
    t.index ["user_id"], name: "index_stripe_payment_histories_on_user_id"
  end

  create_table "stripe_payout_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "paid_out_amount"
    t.integer "paid_out_fee"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stripe_payout_histories_on_user_id"
  end

  create_table "stripe_sessions", force: :cascade do |t|
    t.string "session_id"
    t.bigint "user_id"
    t.integer "product_type"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_price_id"
    t.float "application_fee_amount"
    t.float "application_fee_ratio"
    t.index ["user_id"], name: "index_stripe_sessions_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text   "introduction"
    t.string "identified_char"
    t.index ["identified_char"], name: "index_user_profiles_on_identified_char", unique: true
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "locale"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payments", "users"
  add_foreign_key "social_profiles", "users"
  add_foreign_key "stripe_accounts", "users"
  add_foreign_key "stripe_payout_histories", "users"
end
