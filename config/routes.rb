Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end

	devise_for :customer 
	devise_for :admin, :skip => [:registrations] 

	scope :module => :home do
    root :to => "home#index"
	end

end
