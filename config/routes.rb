Rails.application.routes.draw do
  devise_for :ongs, :controllers => { registrations: 'registrations' }
  get 'signup' => 'ongs#new'
  resources :ongs

  get "portal/list" => "portal_posts#list"
  get "portal/new" => "portal_posts#new"
  post "portal/new" => "portal_posts#create"

  # Add forum resources links
  resources :forum_themes
  resources :forum_topics
  resources :forum_posts
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Needed to import csv data for populating the mortality rate and careunit's databases
  resources :parsers do
    collection { post :importCare }
    collection { post :importRate }
  end

  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'help' => 'static_pages#help'
  get 'about'=> 'static_pages#about'
  get 'opendata' => 'static_pages#opendata'
  resources :mortality_rates
  resources :units
  resources :care_units
  resources :events
  resources :portal_posts
end
