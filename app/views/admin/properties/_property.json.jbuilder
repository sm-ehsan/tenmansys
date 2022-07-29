# frozen_string_literal: true

json.extract! property, :id, :name, :description, :addrline1, :addrline2, :zipcode, :city, :country, :user_id,
              :contactno, :created_at, :updated_at
json.url property_url(property, format: :json)
