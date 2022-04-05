Rails.application.routes.draw do
  root "chapters#index"
  resources :chapters, except: [:index]
  resources :blocks, only: [:create, :edit, :destroy, :update]
  # маршруты для переключения принадлежности блока
  get "/blocks/:id/switch", to: "blocks#switch", as: "switch_block"
  patch "/blocks/:id/switch", to: "blocks#switch_update", as: "switch_update"

  resources :errors
  resources :subsections, except: [:index, :new]

  resources :tasks

  get 'ajax/show'

  namespace :cargo do
    resources :carriers
    resources :customers
    resources :cars, except: [:new, :index]
    get "/carrier/:id/cars/new", to: "cars#new", as: "new_car"
    resources :drivers, except: [:new, :index]
    get "/carrier/:id/drivers/new", to: "drivers#new", as: "new_driver"
    resources :contacts, only: [:destroy, :edit, :update]
    resources :orders
  end
end
