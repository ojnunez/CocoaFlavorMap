class Panel::UsersController < Panel::ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :init_form, except: :index
  def model
    User
  end

  def index
    @items = model.where(conditions)
    add_breadcrumb model.model_name.human(count: :many), index_url
  end

  def new
    @item = model.new
    add_breadcrumb model.model_name.human(count: :many), index_url
    add_breadcrumb t('layouts.admin.breadcrumb.new')

    render template: 'concerns/tabled/new'
  end

  def create
    @item = model.new item_params
    before_controller_create

    if @item.save
      @item.add_role(params[:role])
      redirect_to url_for(action: :edit, id: @item.id), notice: t('layouts.admin.notice.created')
    else
      init_form
      add_breadcrumb model.model_name.human(count: :many), index_url
      add_breadcrumb t('layouts.admin.breadcrumb.new')

      render template: 'concerns/tabled/new'
    end
  end

  def edit
    @item = model.find params[:id]
    add_breadcrumb model.model_name.human(count: :many), index_url
    add_breadcrumb t('layouts.admin.breadcrumb.edit')

    render template: 'concerns/tabled/edit'
  end

  def update
    @item = model.find params[:id]

    m = @item.password.blank? ? :update_without_password : :update_attributes

    if @item.send(m, item_params)
      if @item.roles.blank?
        @item.add_role(params[:role])
      else
        @item.roles = []
        @item.add_role(params[:role])
      end
      redirect_to url_for(action: :edit, id: @item.id), notice: t('layouts.admin.notice.updated')

    else
      add_breadcrumb model.model_name.human(count: :many), index_url
      add_breadcrumb t('layouts.admin.breadcrumb.edit')
      render template: 'concerns/tabled/edit'
    end
  end

  def init_form

    if current_user.has_role?("admin")
      @allowed_roles = User.roles.keys
    else
      @allowed_roles = User.roles.keys.drop(2)
    end
    action_name == "edit" || action_name == "update" ? @roles = User.find(params[:id]).roles.first : @roles = nil

  end

  def item_params
    params.require(:user).permit!
  end

end
