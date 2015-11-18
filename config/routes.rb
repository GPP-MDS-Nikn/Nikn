require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :portal_posts
      resources :care_units
      resources :events
    end
  end

  devise_for :ongs, :controllers => { registrations: 'registrations' }
  devise_for :admins

  resources :ongs
  get "forum_topics/:id/new_report_topic" => 'forum_topics#new_report_topic', as: :new_report_topic
  patch "forum_topics/:id/create_report_topic" => 'forum_topics#create_report_topic', as: :create_report_topic
  get "forum_topics/:id/new_report_post" => 'forum_topics#new_report_post', as: :new_report_post
  patch "forum_topics/:id/create_report_post" => 'forum_topics#create_report_post', as: :create_report_post
  get "admins/reports_index" => 'admins#reports_index'
  resources :forum_themes do
    resources :forum_topics
  end

  resources :forum_topics do
      resources :forum_posts
  end
  resources :forum_posts
  #get "/forum_topics/:forum_topic_id/forum_posts/:id"

  get "portal/list" => "portal_posts#list"
  get "portal/new" => "portal_posts#new"
  post "portal/new" => "portal_posts#create"
  get "portal_posts/index_json" => "portal_posts#index_json"


  #resources :forum_posts
  #get "forum_posts" => "forum_posts#index"

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
