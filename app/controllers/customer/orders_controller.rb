class Customer::OrdersController < ApplicationController
  before_filter :authenticate_customer!

  # GET /customer/view-carts
  def view_carts
    page = params[:page] || 1
    @carts = current_customer.orders.includes(:product => [:product_images]).cart.page(page).per(5) || []
  end

  # GET /customer/view-orders
  def view_orders
    page = params[:page] || 1
    @orders = current_customer.orders.includes(:product).in_order.page(page).per(5) || []
  end

  # GET /customer/checkout 
  def checkout
    @carts = current_customer.orders.includes(:product).cart || []
  end

  # POST /customer/add-to-cart
  def add_to_cart
    begin
      order = Order.new(
        :product_id => params[:id], 
        :date => Date.today, 
        :quantity => 1, 
        :state => 1
      )
      current_customer.orders << order
      cart = current_customer.orders.includes(:product).includes(:product_images).cart

      render :json => cart if request.xhr? >= 0
    rescue 
      puts 'errors'
    end
  end

  # GET /customer/make-an-order
  def make_an_order
    current_customer.orders.cart.update_all(:state => 2)
    render :json => { code: 200 } if request.xhr? >= 0
  end

  # DELETE /customer/remove-cart
  def remove_cart
    cart = Order.find(params[:id])

    cart.destroy
    redirect_to customer_path
  end

end
