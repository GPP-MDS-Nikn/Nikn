Rails.application.routes.draw do

  #get '/ongs/new' => 'ongs#new'
  #post 'ongs' => 'ongs#create'
  #Routes every request to a controller action

  #get '/ongs/:id/edit' => 'ongs#edit' #Here and...
  #patch '/ongs/:id' => 'ongs#update' # ...here  are the routs for editing and updating ongs. Rails is not recognizing my routes!
  #Routes every request to a controller action


  #get 'page/home'
  #get 'page/about'
  #get 'page/contact'

  devise_for :ongs, :controllers => { registrations: 'registrations' }
  get 'signup' => 'ongs#new'
  resources :ongs
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
