Rails.application.routes.draw do
  resources :parsers do
    collection { post :import }
  end
  resources :care_units
  root          'static_pages#home'
  get 'help' => 'static_pages#help'
  resources :events

end
