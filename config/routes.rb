Rails.application.routes.draw do
  root :to => "home#index"

  devise_for :users, controllers: {
    :sessions => "users/sessions",
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

  resource :self do
    collection do
      get :privicy
      patch :bgimg
      patch :privicy_update
    end

    resources :experience

    resources :ability do
      collection do
        post :browse
        post :focus
      end
    end

    resources :job do
      collection do
        post :browse
        post :focus
      end
    end

    ##########used##########
    # selves#create
    # selves#edit
    # selves#update
    # 
    # experience#index
    # experience#new
    # experience#update
    # experience#edit
    # experience#destroy
    # 
    # ability#index
    # ability#new
    # ability#create
    # ability#update
    # ability#edit
    # ability#destroy
    # 
    # job#index
    # job#new
    # job#create
    # job#update
    # job#edit
    # job#destroy
    ##########used##########
  end

  get 'find/people'
  get 'find/work'
  get 'userinfo/info/:id', :to => 'userinfo#info'
  get 'userinfo/experience/:id', :to => 'userinfo#experience'

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
