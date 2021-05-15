Rails.application.routes.draw do
  
  resources :payments 
  resources :payment_methods
  
  resources :tenants do
    member do
      get 'show_payments'  => 'tenants#show_payments'
      get 'new_payment'  => 'tenants#new_payment'
    end
  end
  
  resources :repairs
  resources :type_repairs
  
  resources :appliances 
  resources :gadgets
  resources :home_owner_administrators
  resources :properties do 
    member do
      get 'show_appliances'  => 'properties#show_appliances'
      get 'new_appliance'  => 'properties#new_appliance'
      get 'show_repairs'  => 'properties#show_repairs' 
      get 'new_repair'  => 'properties#new_repair'
      get 'show_tenants'  => 'properties#show_tenants' 
      get 'new_tenant'  => 'properties#new_tenant'
    end
  end

  resources :propiedads, only: [:index, :new, :create, :destroy]


  resources :inscritos
  resources :inscritos
  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :roles

  resources :users

  resources :inventarios

  resources :tiendas

  resources :articulos

  resources :modelos

  resources :componentes

  resources :unidad_medidas

  resources :empresas

  authenticated :user? do
    root to: "users#index", as: :authenticated_root
  end 
  root to: "welcome#index"
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
