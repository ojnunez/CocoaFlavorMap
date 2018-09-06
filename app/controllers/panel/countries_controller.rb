class Panel::CountriesController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def model
    Country
  end

  def item_params
    params.require(:country).permit!
  end
end
