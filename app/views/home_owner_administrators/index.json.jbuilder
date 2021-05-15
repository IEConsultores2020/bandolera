json.array!(@home_owner_administrators) do |home_owner_administrator|
  json.extract! home_owner_administrator, :id, :name, :email, :mobile
  json.url home_owner_administrator_url(home_owner_administrator, format: :json)
end
