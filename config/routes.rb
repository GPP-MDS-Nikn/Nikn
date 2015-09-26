Rails.application.routes.draw do
  resources :parsers do
    collection { post :import }
  end
  resources :units
end
