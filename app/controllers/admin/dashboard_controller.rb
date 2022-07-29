# frozen_string_literal: true

module Admin
  class DashboardController < Admin::ApplicationController
    def index
      @pagy, @rents = pagy(Rent.all.order('created_at desc'), items: 10)
      @tenants = Tenant.all
      @units = Unit.all
      @properties = Property.all
      @expense = Expense.all
    end
  end
end
