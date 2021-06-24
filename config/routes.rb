Rails.application.routes.draw do
  resources :villains
  resources :heros

  resources :squads, only: [:index] do
    resources :villains, only: [:index, :new, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
