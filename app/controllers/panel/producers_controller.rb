class Panel::ProducersController  < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def model
    Producer
  end

  def item_params
    params.require(:producer).permit!
  end
end
