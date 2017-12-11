Rails.application.routes.draw do
  # Back admin routes start
  namespace :admin do
    resources :users

    # Admin root
    root to: 'application#index'
    resources :homes, except: [:show, :index]
    resources :employees, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :areas, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :departments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :abilities, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :educations, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :positions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :instructors, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :calls, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  post 'admin/reports/comparacion' => 'admin/reports#create'
  get 'admin/comparacion' => 'admin/reports#new'

  post 'admin/calls/asistencia' => 'admin/calls#showlist' 
  get 'admin/asistencia' => 'admin/calls#attendance'             
  # Application root
  root to: 'application#home'
  # Front routes end
end
