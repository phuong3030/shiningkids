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

  end

  namespace :customer do 
    get '/my-account', :to => 'account#my_account'

    get '/cart', :to => 'order#cart'
    get '/checkout', :to => 'order#checkout'
    post '/checkout', :to => 'order#make_an_order'
  end

	scope :module => :home do
    root :to => 'home#index'
	end

end
