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
  get 'ajax/customers_show'
  get 'ajax/carriers_show'
  get 'ajax/cars'
  get 'ajax/drivers'
  get 'ajax/towns_from'
  get 'ajax/towns_in'

  namespace :cargo do
    resources :carriers
    resources :customers
    resources :cars, except: [:new, :index]
    get "/carrier/:id/cars/new", to: "cars#new", as: "new_car"
    resources :drivers, except: [:new, :index]
    get "/carrier/:id/drivers/new", to: "drivers#new", as: "new_driver"
    resources :contacts, only: [:destroy, :edit, :update]
    get "/orders/:id/file_exist", to: "orders#file_exist", as: "file_exist"
    get "/orders/:id/file_exist_i", to: "orders#file_exist_i", as: "file_exist_i"
    get "/orders/arhive", to: "orders#arhive", as: "arhive"
    post "/orders/exits_folder", to: "orders#folder", as: "exist_folder"
    post "/orders/exits_doc", to: "orders#doc", as: "exist_doc"
    resources :orders
    get "/towns/parsing", to: "towns#parsing", as: "parsing_towns"
    resources :towns
  end
end
