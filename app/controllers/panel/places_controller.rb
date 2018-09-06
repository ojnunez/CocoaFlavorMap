class Panel::PlacesController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def model
    Place
  end

  def item_params
    params.require(:place).permit!
  end
end
