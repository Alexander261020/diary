Rails.application.routes.draw do
  root "chapters#index"
  resources :chapters, except: [:index]
  resources :blocks, only: [:create, :edit, :destroy, :update]
end
