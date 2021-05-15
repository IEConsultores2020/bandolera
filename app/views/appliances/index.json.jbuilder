json.array!(@appliances) do |appliance|
  json.extract! appliance, :id, :property_id, :gadget_id, :description_string, :acquisition_date, :warranty, :contact_number, :contact_email, :active
  json.url appliance_url(appliance, format: :json)
end
