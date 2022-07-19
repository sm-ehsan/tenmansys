class Admin::DashboardController < Admin::ApplicationController
  def index
    @rents = Rent.all.order('created_at desc')
    @tenants = Tenant.all
    @units = Unit.all
  end
end
