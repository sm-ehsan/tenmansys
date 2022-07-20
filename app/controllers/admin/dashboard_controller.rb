class Admin::DashboardController < Admin::ApplicationController
  def index
    @pagy, @rents = pagy(Rent.all.order('created_at desc'), items: 5)
    @tenants = Tenant.all
    @units = Unit.all
  end
end
