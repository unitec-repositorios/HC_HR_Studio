Rails.application.routes.draw do
  # Back admin routes start
  namespace :admin do
    resources :users

    # Admin root
    root to: 'configurationscreens#index'
    resources :homes, except: [:show, :index]
    resources :employees, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :areas, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :departments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :abilities, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :educations, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :positions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :instructors, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :configurationscreens, only: [:new, :create]
    resources :schedules, only: [:index, :show, :new, :edit, :create] do
      collection { post :import }
    end
    resources :calls, only:[:index, :new, :create, :edit, :update, :destroy, :show ] do
      collection do
      post :attended
      end 
    end
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  post 'admin/reports/comparacion' => 'admin/reports#create'
  get 'admin/comparacion' => 'admin/reports#new'

  get 'admin/organizacionals' => 'admin/organizacionals#index'

  post 'admin/calls/asistencia' => 'admin/calls#showlist'

  get 'admin/asistencia' => 'admin/calls#attendance'
  get 'admin/reports/employee' => 'admin/reports#employee'    
  get 'admin/schedules' => 'admin/schedules#index'   
  get 'admin/schedules/import' => 'admin/schedules#import'   
  get 'admin/schedules/new' => 'admin/schedules#new'  
  get 'admin/schedules/show' => 'admin/schedules#show'  
  # Application root
  root to: 'application#home'
  # Front routes end
end
