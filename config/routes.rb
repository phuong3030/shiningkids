Rails.application.routes.draw do
	devise_for :admins, :skip => [:registration] 

	scope :module => :home, :shallow_path => "home" do
		root :to => "home#index"
	end
end
