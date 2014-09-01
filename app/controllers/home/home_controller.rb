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

    @category = Category.find(params[:id])
    @products = @category.products.includes(:product_images).page(page).per(5)

    redirect_to root_url unless @products
  end

  # GET /products/:id
  def show_product
    @product = Product.includes(:product_images).find(params[:id])
    @images = @product.product_images

    redirect_to root_url unless @product
  end

  # GET /contact-us 
  def contact
  end

  # GET /about-us
  def about 
  end

end
