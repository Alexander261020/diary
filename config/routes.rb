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
    resources :customers
  end
end
