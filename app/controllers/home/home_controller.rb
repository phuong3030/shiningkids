class Home::HomeController< ActionController::Base

	layout 'application'

  # GET / 
  def index
    @new_products = Product.includes(:product_images).includes(:category).first(8)
  end

  # GET /categories/:id
  def show_category
    # INIT paginator
    page = params[:page] || 1

    @products = Product.page(page).per(8)
  end

  # GET /categories/:id/products/:id
  def show_product
    
  end

  # GET /contact-us 
  def contact
  end

  # GET /about-us
  def about 
  end

end
