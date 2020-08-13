Rails.application.routes.draw do
  get 'doses/destroy'
  get 'doses/create'
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :doses, only: [:create, :new]
  end

  resources :doses, only: :destroy
end
