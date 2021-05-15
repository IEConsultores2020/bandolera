json.array!(@type_repairs) do |type_repair|
  json.extract! type_repair, :id, :name, :description
  json.url type_repair_url(type_repair, format: :json)
end
