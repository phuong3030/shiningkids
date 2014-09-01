class Admin::ProductImagesController < ApplicationController

  before_action :set_product_image

  # GET /product_images
  def index
    @product_images = ProductImage.all
  end

  # GET /product_images/1
  def show
  end

  # GET /product_images/new
  def new
    @product_image = ProductImage.new
  end

  # GET /product_images/1/edit
  def edit
  end

  # POST /product_images
  def create
    @product_image = ProductImage.new(product_image_params)

    if @product_image.save
      redirect_to admin_category_product_image_path(@category, @product, @product_image), notice: 'Product image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_images/1
  def update
    if @product_image.update(product_image_params)
      redirect_to admin_category_product_image_path(@category, @product, @product_image), notice: 'Product image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_images/1
  def destroy
    @product_image.destroy
    redirect_to admin_category_product_images_url, notice: 'Product image was successfully destroyed.'
  end

  private
  def set_product_image
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:product_id])
    @product_image = @product.product_images.find(params[:id]) if params[:id]
  end

  def product_image_params
    params.require(:product_image).permit(:img_type, :image, :product_id)
  end

end
