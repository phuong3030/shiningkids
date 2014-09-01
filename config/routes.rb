Rails.application.routes.draw do

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
  end

  namespace :customer do 
    get '/', :to => 'account#my_account'
    get '/my-account', :to => 'account#my_account'

    get '/view-carts', :to => 'orders#view_carts'
    get '/checkout', :to => 'orders#checkout'
    get '/view-orders', :to => 'orders#view_orders'
    post '/checkout', :to => 'orders#make_an_order'
  end

	scope :module => :home do
    root :to => 'home#index'

    get '/categories/:id', :to => 'home#show_category', :as => 'group_products'
    get '/product/:id', :to => 'home#show_product', :as => 'product_detail'
    get '/contact-us', :to => 'home#contact'
    get '/about-us', :to => 'home#about'
	end

end
