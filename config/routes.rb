Rails.application.routes.draw do

  resources :parsers do
    collection { post :import }
  end
  resources :care_units
  root          'static_pages#home'
  get 'help' => 'static_pages#help'
  resources :events

  #get '/ongs' => 'ongs#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
