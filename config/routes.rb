GagoitDocuments::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :posts do
    resources :comments

    get "search", on: :collection, defaults: {format: :html}
  end

  root :to => 'home#index'

  devise_for :users, :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}, 
    :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "registrations", confirmations: "confirmations"} 

  resources :users

  resources :friendships

  resources :events

  match "/about", to: "static_pages#about"
  match "/cat_tuong", to: "static_pages#cat_tuong"

  resources :tournaments do
    resources :standings

    resources :groups
  end

  resources :matches do
    resources :bet_scores

    get 'bet_scores_in_match', on: :member
  end

  resources :teams

  resources :tournament_photos

  resources :team_photos

  resources :match_photos

  match "/admin/users", to: "admins#users", via: :get
  match "/admin", to: "admins#index", via: :get

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
