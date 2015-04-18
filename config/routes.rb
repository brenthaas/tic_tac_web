Rails.application.routes.draw do

  resources :games, only: [:index, :create, :show] do
    member do
      put 'make_move'
    end
  end
end
