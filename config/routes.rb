Rails.application.routes.draw do
	comfy_route :cms_admin, :path => '/admin'

	devise_for :admins, :skip => [:registration] 

	scope :module => :home, :shallow_path => "home" do
		root :to => "home#index"
	end

	# Make sure this routeset is defined last
	comfy_route :cms, :path => '/', :sitemap => false

end
