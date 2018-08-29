class Panel::ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout "admin/application"

  include Tabled

end
