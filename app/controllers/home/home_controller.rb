class Home::HomeController< ActionController::Base

	layout 'application'

  # GET / 
  def index
    @new_products = Product.first(8)
  end

  # GET /contact-us 
  def contact
  end

  # GET /about-us
  def about 
  end

end
