Rails.application.routes.draw do
  root "chapters#index"
  resources :chapters, except: [:index]
  resources :blocks, only: [:create, :edit, :destroy, :update]

  # маршруты для переключения принадлежности блока
  get "/blocks/:id/switch", to: "blocks#switch", as: "switch_block"
  patch "/blocks/:id/switch", to: "blocks#switch_update", as: "switch_update"

  resources :subsections, except: [:index, :new]
end
