json.array!(@inscritos) do |inscrito|
  json.extract! inscrito, :id, :user_id, :empresa_id
  json.url inscrito_url(inscrito, format: :json)
end
