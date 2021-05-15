json.array!(@payments) do |payment|
  json.extract! payment, :id, :tenant_id, :paid_period, :details, :payment_method_id, :value, :applied
  json.url payment_url(payment, format: :json)
end
