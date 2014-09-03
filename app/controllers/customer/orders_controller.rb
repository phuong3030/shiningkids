class Customer::OrdersController < ApplicationController
  before_filter :authenticate_customer!

  # GET /customer/view-carts
  def view_carts
    @cart = current_customer.orders.includes(:product).includes(:product_images).cart
  end

  # GET /customer/view-orders
  def view_orders
    @orders = current_customer.orders.includes(:product)
  end

  # GET /customer/checkout 
  def checkout
    @cart = current_customer.orders.includes(:product).cart
  end

  # POST /customer/add-to_cart
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
    current_customer.orders.update_all(:state => 2)
  end

end
