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
    get '/view-orders', :to => 'order#view_orders'
  end

  namespace :customer do 
    get '/my-account', :to => 'account#my_account'

    get '/view-cart', :to => 'order#view_cart'
    get '/checkout', :to => 'order#checkout'
    post '/checkout', :to => 'order#make_an_order'

    get '/view-orders', :to => 'order#view_orders'
  end

	scope :module => :home do
    root :to => 'home#index'

    get '/categories/:id', :to => 'categories#show'
    get '/categories/:id/products/:id', :to => 'products#show'
    get '/contact-us', :to => 'home#contact'
    get '/about-us', :to => 'home#about'
	end

end
