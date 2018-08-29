module Componentable
  extend ActiveSupport::Concern

  included do
    respond_to :html, :json

    before_filter :init_breadcrumb

    helper_method :index_url
    helper_method :item_url
    helper_method :model
    helper_method :namespace
  end

  def init_breadcrumb
    add_breadcrumb I18n.t('layouts.admin.breadcrumb.home'), root_url
  end

  def conditions(conditions = {})
    conditions
  end


  def model
    raise NoTypeGivenError
  end

  def index_url
    url_for action: :index
  end

  def item_url(id)
    url_for action: :show, id: id
  end

  def show
    prepare_data
    @item = model.friendly.active.find(params[:id])
    add_breadcrumb @item.title, page_url(@item)
  end

  def prepare_data
    @image_element = ImageElement.where(image_elementable_type: model, image_elementable_id: model.friendly.find(params[:id]).id).where(gallery: false)
    @galleries = ImageElement.where(image_elementable_type: model, image_elementable_id: model.friendly.find(params[:id]).id).where(gallery: true)
    @content_element = Element.where(elementable_type: model, elementable_id: model.friendly.find(params[:id]).id)
    @audio_element = AudioElement.where(audio_elementable_type: model, audio_elementable_id: model.friendly.find(params[:id]).id)
    @video_element = VideoElement.where(video_elementable_type: model, video_elementable_id: model.friendly.find(params[:id]).id)
    @document_element = DocumentElement.where(document_elementable_type: model, document_elementable_id: model.friendly.find(params[:id]).id)
    @elements = (@image_element + @content_element + @audio_element + @video_element + @document_element + @galleries) # or however many you have
    @elements.sort_by!{|e| e.order.to_i}.map{ |key, value| [key, value]}.to_h.compact

  end

end
