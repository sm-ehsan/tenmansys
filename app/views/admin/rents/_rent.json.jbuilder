json.extract! rent, :id, :rentmonth, :duedate, :paymentdate, :rent, :gassbill, :lightbill, :servicecharge, :status, :user_id, :tenant_id, :created_at, :updated_at
json.url rent_url(rent, format: :json)
