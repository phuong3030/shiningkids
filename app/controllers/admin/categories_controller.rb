class Admin::CategoriesController < ApplicationController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  def index
    @admin_categories = Category.all
  end

  # GET /admin/categories/1
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  def create
    @admin_category = Category.new(admin_category_params)

    if @admin_category.save
      redirect_to admin_category_path(@admin_category), notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/categories/1
  def update
    if @admin_category.update(admin_category_params)
      redirect_to admin_category_path(@admin_category), notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/categories/1
  def destroy
    @admin_category.destroy
    redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_category_params
      params.require(:category).permit(:name, :description, :image)
    end
end
