# frozen_string_literal: true

json.extract! tenant, :id, :name, :nid, :email, :mobile, :peraddrline1, :peraddrline2, :peraddrline3, :zipcode, :city,
              :country, :entrydate, :exitdate, :rentpermonth, :advancepaid, :status, :user_id, :property_id, :unit_id, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
