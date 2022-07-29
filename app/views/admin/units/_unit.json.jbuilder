# frozen_string_literal: true

json.extract! unit, :id, :name, :bedroom, :bathroom, :drawingroom, :dining, :kitchen, :user_id, :property_id,
              :created_at, :updated_at
json.url unit_url(unit, format: :json)
