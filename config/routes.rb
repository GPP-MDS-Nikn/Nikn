Rails.application.routes.draw do
  resources :parsers do
    collection { post :import }
  end
  root          'static_pages#home'

  resources :units
  resources :events
  resources :portal_posts
  
  get 'contact' => 'static_pages#contact'
  get 'help' => 'static_pages#help'
  get 'about'=> 'static_pages#about'
end
