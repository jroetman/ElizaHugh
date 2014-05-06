ElizaHugh::Application.routes.draw do
  resources :carts

  get "admin/index"
  get "admin/specials"
  get "admin/products"
  get "admin/paymentSettings"
  post "admin/updatePaymentInfo"
  get 'admin', to: 'admin#index'
  get "admin/addProductRemote"
  get "products/index"
  get "products/partIdx"
  get "products/show"
  get "specials/index"
  get "welcome/index"
  get "welcome/terms"
  get "users/login"
  get  "cart"  => "cartitems#index"
  post "create_user" => "users/create"
  get  "products/:id/add_to_cart" => "cartitems#add"
  get  "cartitems/delete/:id" => "cartitems#delete"
  get  "cart/checkout" => "cartitems#checkout"
  post "cart/charge" => "cartitems#charge"
  get  "cart/complete" => "cartitems#complete"
  
  #reservations
  get  "product/reserve" => "reservation_queues#reserve"
  get  "product/cancel_reservation" => "reservation_queues#cancel"
  
  post "products/createRemote"
  #authentication
  post "authentication/login"
  get  "authentication/logout"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password" 
  get "forgot_password" => "authentication#forgot_password"
  get "password_sent"   => "authentication#password_sent"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :products
  resources :specials
  resources :users
  resources :billing_addresses	
  resources :shipping_addresses
 
 
  resources :products do
      member do
        post 'add_to_cart'
      end
  end
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
