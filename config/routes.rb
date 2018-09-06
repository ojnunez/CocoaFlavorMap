Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  mount Ckeditor::Engine => '/ckeditor'

  namespace :panel do
    root to: "dashboard#index"
    resources :countries
    resources :producers
    resources :places
    resources :profile, only: [:edit, :update]
    resources :users
  end
  root to: "dashboard#index"

end
