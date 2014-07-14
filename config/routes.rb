Rails.application.routes.draw do
	mount Alchemy::Engine => '/cms'

	scope :module => :home, :shallow_path => "home" do
		root :to => "home#index"
	end
end
