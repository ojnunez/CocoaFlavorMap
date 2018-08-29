class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    return panel_root_url if resource_or_scope == :panel
    super
  end

end
