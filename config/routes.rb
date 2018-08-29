Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  mount Ckeditor::Engine => '/ckeditor'

  namespace :panel do
    root to: "dashboard#index"

    resources :events do
      collection do
        get :list
      end
    end #actividades
    resources :grades do
      collection do
        get :personal
      end
    end #notas
    resources :school_classes #grados (1ero, ....)
    resources :subjects #materias
    resources :periods #periodos
    resources :stages #etapa escolar
    resources :contacts
    resources :profile, only: [:edit, :update]
    resources :users
    resources :notifications, only: [:index]
  end
  root to: "dashboard#index"

end
