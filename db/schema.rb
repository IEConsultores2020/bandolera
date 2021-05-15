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

ActiveRecord::Schema.define(version: 20190328155614) do

  create_table "appliances", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "gadget_id"
    t.string   "description_string"
    t.date     "acquisition_date"
    t.integer  "warranty"
    t.integer  "contact_number"
    t.string   "contact_email"
    t.boolean  "active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "invoice"
    t.date     "inactive_date",      null: false
    t.integer  "purchase_price"
    t.integer  "user_id"
  end

  add_index "appliances", ["gadget_id"], name: "index_appliances_on_gadget_id"
  add_index "appliances", ["property_id"], name: "index_appliances_on_property_id"
  add_index "appliances", ["user_id"], name: "index_appliances_on_user_id"

  create_table "articulos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "foto"
    t.string   "barcode"
    t.integer  "unidad_medida_id"
    t.integer  "componente_id"
    t.integer  "modelo_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "articulos", ["componente_id"], name: "index_articulos_on_componente_id"
  add_index "articulos", ["modelo_id"], name: "index_articulos_on_modelo_id"
  add_index "articulos", ["unidad_medida_id"], name: "index_articulos_on_unidad_medida_id"
  add_index "articulos", ["user_id"], name: "index_articulos_on_user_id"

  create_table "componentes", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "empresa_id"
  end

  add_index "componentes", ["user_id"], name: "index_componentes_on_user_id"

  create_table "empresas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "webpage"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "empresas", ["user_id"], name: "index_empresas_on_user_id"

  create_table "gadgets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "home_owner_administrators", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscritos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "activo"
  end

  add_index "inscritos", ["empresa_id"], name: "index_inscritos_on_empresa_id"
  add_index "inscritos", ["user_id"], name: "index_inscritos_on_user_id"

  create_table "inventarios", force: :cascade do |t|
    t.date     "fecha_ingreso"
    t.string   "moneda"
    t.string   "cantidad_integer"
    t.integer  "valor_unidad"
    t.integer  "valor_total"
    t.integer  "tienda_id"
    t.integer  "articulo_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "inventarios", ["articulo_id"], name: "index_inventarios_on_articulo_id"
  add_index "inventarios", ["tienda_id"], name: "index_inventarios_on_tienda_id"
  add_index "inventarios", ["user_id"], name: "index_inventarios_on_user_id"

  create_table "modelos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "empresa_id"
  end

  add_index "modelos", ["user_id"], name: "index_modelos_on_user_id"

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "tenant_id"
    t.date     "paid_period"
    t.text     "details"
    t.integer  "payment_method_id"
    t.integer  "value"
    t.boolean  "applied"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  add_index "payments", ["payment_method_id"], name: "index_payments_on_payment_method_id"
  add_index "payments", ["tenant_id"], name: "index_payments_on_tenant_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "properties", force: :cascade do |t|
    t.string   "unencumbered"
    t.string   "attachment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "landlord"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "zipcode"
    t.string   "area"
    t.integer  "purchase_price"
    t.date     "purchase_date"
    t.integer  "expenses"
    t.integer  "net_income"
    t.integer  "earning_capacity"
    t.integer  "gross_income"
    t.string   "owner_ship_certificate"
    t.integer  "home_owner_administrator_id"
    t.integer  "profit"
    t.integer  "user_id"
  end

  add_index "properties", ["home_owner_administrator_id"], name: "index_properties_on_home_owner_administrator_id"
  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "propiedads", force: :cascade do |t|
    t.string   "nombre"
    t.string   "archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "props", force: :cascade do |t|
    t.string   "landlord"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "zipcode"
    t.string   "area"
    t.string   "hoa"
    t.integer  "purchaseprice"
    t.date     "purchasedate"
    t.integer  "expenses"
    t.integer  "net_proceeds"
    t.integer  "earning_capacity"
    t.integer  "gross_income"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.integer  "type_repair_id"
    t.text     "details"
    t.string   "contractors"
    t.string   "email"
    t.string   "phone"
    t.integer  "cost"
    t.integer  "warranty"
    t.date     "date_repair"
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "purchase_order"
  end

  add_index "repairs", ["property_id"], name: "index_repairs_on_property_id"
  add_index "repairs", ["type_repair_id"], name: "index_repairs_on_type_repair_id"
  add_index "repairs", ["user_id"], name: "index_repairs_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "monthly_rent"
    t.integer  "monthly_administration"
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "name"
    t.integer  "phone"
    t.string   "email"
    t.boolean  "leasing"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "leasing_contract"
  end

  add_index "tenants", ["property_id"], name: "index_tenants_on_property_id"
  add_index "tenants", ["user_id"], name: "index_tenants_on_user_id"

  create_table "tiendas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "empresa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "tiendas", ["empresa_id"], name: "index_tiendas_on_empresa_id"
  add_index "tiendas", ["user_id"], name: "index_tiendas_on_user_id"

  create_table "type_repairs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "unidad_medidas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "empresa_id"
  end

  add_index "unidad_medidas", ["user_id"], name: "index_unidad_medidas_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.boolean  "email_confirmed"
    t.string   "confirm_token"
    t.integer  "einvoice"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
