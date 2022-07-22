json.extract! expense, :id, :paymentdate, :name, :amount, :note, :user_id, :tenant_id, :unit_id, :property_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
