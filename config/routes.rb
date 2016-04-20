Rails.application.routes.draw do
 
  root               'static_pages#home'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'contact'   => 'static_pages#contact'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :articles
  resources :categories
  resources :cities do
    match '/search' => 'cities#search', as: :search_city, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'cities#consult', as: :consult_city, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :companies do
    match '/search' => 'companies#search', as: :search_company, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'companies#consult', as: :consult_company, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :countries do
    match '/search' => 'countries#search', as: :search_country, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'countries#consult', as: :consult_country, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :doc_types do
    match '/search' => 'doc_types#search', as: :search_doc_type, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'doc_types#consult', as: :consult_doc_type, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :expenditure_types do
    match '/search' => 'expenditure_types#search', as: :search_expenditure_type, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'expenditure_types#consult', as: :consult_expendityre_type, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :expenditures
  resources :marks do
    match '/search' => 'marks#search', as: :search_mark, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'marks#consult', as: :consult_mark, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end

  resources :provinces do
    match '/search' => 'provinces#search', as: :search_province, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'provinces#consult', as: :consult_province, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  resources :sales
  resources :turns
  resources :users do
    match '/search' => 'users#search', as: :search_user, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
    match '/consult' => 'users#consult', as: :consult_user, via:[:get,:post], on: :collection, :defaults => {:format => 'json'}
  end
  
  

  #bootstrap modal
  get "cities/search" => 'cities#search', :as => :cities_search



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
