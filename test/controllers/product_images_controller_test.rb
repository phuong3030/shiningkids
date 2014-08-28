require 'test_helper'

class ProductImagesControllerTest < ActionController::TestCase
  setup do
    @product_image = product_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_image" do
    assert_difference('ProductImage.count') do
      post :create, product_image: { img_type: @product_image.img_type }
    end

    assert_redirected_to product_image_path(assigns(:product_image))
  end

  test "should show product_image" do
    get :show, id: @product_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_image
    assert_response :success
  end

  test "should update product_image" do
    patch :update, id: @product_image, product_image: { img_type: @product_image.img_type }
    assert_redirected_to product_image_path(assigns(:product_image))
  end

  test "should destroy product_image" do
    assert_difference('ProductImage.count', -1) do
      delete :destroy, id: @product_image
    end

    assert_redirected_to product_images_path
  end
end
