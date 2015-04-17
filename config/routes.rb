Rails.application.routes.draw do

  resources :games, only: [:create, :show] do
    member do
      put 'make_move'
    end
  end
end
