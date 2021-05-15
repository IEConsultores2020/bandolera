json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :property_id, :monthly_rent, :monthly_administration, :begin_date, :end_date, :name, :phone, :email, :leasing, :user_id
  json.url tenant_url(tenant, format: :json)
end
