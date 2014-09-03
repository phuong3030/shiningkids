class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :show_cart

  def after_sign_in_path_for(resource)
    case resource.type
    when 'Customer'
      customer_path
    when 'Admin'
      admin_path 
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end

  def show_cart
    if customer_signed_in?
      @carts = current_customer.orders.includes(:product => [:product_images]).cart 
    else
      @carts = []
    end
  end
end
