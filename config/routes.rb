Rails.application.routes.draw do

  resources :paramclavs
  resources :extras
  resources :registros, :path => 'usuarios'
  post 'paramclavs/traer_paramcla', to: 'paramclavs#traer_paramcla'
  get 'sessions/create'

  get 'sessions/destroy'

  resources :requests#, :path => 'requests?estado=registrada'
  #devise_for :users
  get 'index/index'
  get 'index/tablerocomando'
  get 'index/organigrama'
  get 'index/misrequests'#, :path => 'requests?user_id=request_id&estado=asignada'
    get 'index/aceptados'
      get 'index/rechazados'
      get 'index/parametros'

#get '/request/:id/update' => 'groups#associate_subgroup_with_org', :as => :associate_subgroup
  
#get 'request/:id', :action => 'aceptar', :via => [:get], :controller => "requests"
#patch 'request/:id', :action => 'update', :via => [:put], :controller => "requests", as: => :actualizar
  resources :requests do
    resources :extras #do
     # match 'actualiza', :action => 'actualiza', :controller => 'extras', :via => [:get]
    #end
  end

  match 'extra/update', :action => 'crear', :via => [:get], :controller => "requests", :as => :crearto

  #match 'parametroclaves/update', :action => 'update', :via => [:post], :controller => "parametroclaves", :as => :update
 resources :requests do
  resources :extras
  #
   match 'reclamar', :action => 'reclamar', :controller => 'requests', :via => [:get]
  #match 'reclamar_request' => 'request#reclamar', :via => [:get], :as => 'reclamar_request'
  #match 'gallery_:id' => 'gallery#show', :via => [:get], :as => 'gallery_show'
end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :requests
      match 'request/actualiza', :action => 'actualiza', :via => [:get], :controller => "requests", :as => :actu
      match 'request/crear', :action => 'crear', :via => [:get], :controller => "requests", :as => :crearto
      match 'request/contra', :action => 'contra', :via => [:get], :controller => "requests", :as => :mcontra
      match 'request/registrados', :action => 'registrado', :via => [:get], :controller => "requests", :as => :registrados
      match 'request/misrequests', :action => 'mirequest', :via => [:get], :controller => "requests", :as => :misrequests
      match 'request/create', :action => 'create', :via => [:post], :controller => "requests", :as => :create
    #  match 'request/err', :action => 'err', :via => [:get], :controller => "requests", :as => :errores
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  #devise_scope :user do
   # get '/users/sign_out' => 'devise/sessions#destroy'
  #end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'index#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
