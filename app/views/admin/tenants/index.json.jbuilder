# frozen_string_literal: true

json.array! @tenants, partial: 'tenants/tenant', as: :tenant
