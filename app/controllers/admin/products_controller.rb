class Admin::ProductsController < ApplicationController
  before_action :set_product
  before_filter :authenticate_admin!

  # GET /products
  def index
    @products = @category.products
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_category_product_path(@category, @product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to admin_category_product_path(@category, @product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to admin_category_products_url, notice: 'Product was successfully destroyed.'
  end

  private
  def set_product
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id]) if params[:id]
  end

  def product_params
    params.require(:product).permit(:name, :price, :saleoff, :description, :category_id, :name_vi, :description_vi, :price_vi, :saleoff_vi)
  end
end
