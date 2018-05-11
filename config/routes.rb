Rails.application.routes.draw do
  resources :users
  root 'home#home', as: "home"
  get "/foodrecipes", to: "home#foodrecipes", as: "foodrecipes"
  get "/fitness", to: "home#fitness", as: "fitness"
  get "/community", to: "home#community", as: "community"
  get "/contact", to: "home#contact", as: "contact"
  get "/map", to: "home#map", as: "map" 
  get "/calendar", to: "home#calendar", as: "calendar"
  get "/recipeupload", to: "home#recipeupload", as: "recipeupload"
  
  get "/bbq", to: "originalrecipes#bbq", as: "bbq"
  get "/blackbean", to: "originalrecipes#blackbean", as: "blackbean"
  get "/lithuania", to: "originalrecipes#lithuania", as: "lithuania"
  get "/meal", to: "originalrecipes#meal", as: "meal"
  get "/onionmeat", to: "originalrecipes#onionmeat", as: "onionmeat"
  get "/ramen", to: "originalrecipes#ramen", as: "ramen"
  get "/roast", to: "originalrecipes#roast", as: "roast"
  get "/salmon", to: "originalrecipes#salmon", as: "salmon"
  get "/special", to: "originalrecipes#special", as: "special"
  get "/sticksnpeas", to: "originalrecipes#sticksnpeas", as: "sticksnpeas"
  get "/stixs", to: "originalrecipes#stixs", as: "stixs"
  get "/wraps", to: "originalrecipes#wraps", as: "wraps"
  
  get "/signup", to: "users#new", as: "signupnew"
  
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create", as: "session"
  delete "logout", to: "sessions#destroy"
  
  resources :users do
    member do
      get :connoisseur
      get :souschef
    end
  end
  
  resources :recipes,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
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
