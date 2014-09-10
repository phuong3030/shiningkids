Rails.application.routes.draw do

  scope ":locale", :locale => /#{I18n.available_locales.join("|")}/ do 

    devise_for :customer 
    devise_for :admin, :skip => [:registrations] 

    namespace :admin do
      # CRUD nested category, product, image
      resources :categories do 
        resources :products do 
          resources :product_images, :as => :images
        end
      end

      # View orders route
      get '/view-orders', :to => 'orders#view_orders'
      get '/', :to => 'categories#index'
    end

    namespace :customer do 
      get '/', :to => 'account#my_account'
      get '/edit-account-information', :to => 'account#edit_account_information'
      patch '/edit-account-information', :to => 'account#edit_customer'

      get '/view-carts', :to => 'orders#view_carts'
      get '/checkout', :to => 'orders#checkout'
      get '/view-orders', :to => 'orders#view_orders'
      post '/checkout', :to => 'orders#make_an_order'
      delete '/remove-this-cart/:id', :to => 'orders#remove_cart', :as => 'remove_this_cart'
      post '/cart', :to => 'orders#add_to_cart'
    end

    scope :module => :home do
      root :to => 'home#index'

      get '/categories/:id', :to => 'home#show_category', :as => 'group_products'
      get '/product/:id', :to => 'home#show_product', :as => 'product_detail'
      get '/contact-us', :to => 'home#contact'
      get '/about-us', :to => 'home#about'
    end

  end

  get '', :to => redirect("/#{I18n.default_locale}")

end
