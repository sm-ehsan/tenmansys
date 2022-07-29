# frozen_string_literal: true

module Admin
  class ApplicationController < ApplicationController
    before_action :authenticate_user!
    layout 'admin'
  end
end
