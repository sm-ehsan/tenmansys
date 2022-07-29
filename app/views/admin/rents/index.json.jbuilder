# frozen_string_literal: true

json.array! @rents, partial: 'rents/rent', as: :rent
