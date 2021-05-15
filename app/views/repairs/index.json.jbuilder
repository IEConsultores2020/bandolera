json.array!(@repairs) do |repair|
  json.extract! repair, :id, :type_repair_id, :details, :contractors, :email, :phone, :cost, :warranty, :date_repair, :user_id, :property_id
  json.url repair_url(repair, format: :json)
end
