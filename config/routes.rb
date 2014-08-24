Rails.application.routes.draw do

	devise_for :customer 
	devise_for :admin, :skip => [:registrations] 

  namespace :admin do
    resources :categories do 
      resources :products
    end
  end

	scope :module => :home do
    root :to => "home#index"
	end

end
