# frozen_string_literal: true

module Admin
  class DashboardController < Admin::ApplicationController
    def index
      @rents = Rent.limit(20).order('created_at desc')
      @tenants = Tenant.all
      @units = Unit.all
      @properties = Property.all
      @expense = Expense.all
    end
  end
end
