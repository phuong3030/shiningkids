class Customer::OrdersController < ApplicationController
  before_filter :authenticate_customer!

  # GET /customer/view-carts
  def view_carts
    @cart = current_customer.orders.includes(:product).cart
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
  def add_item_to_cart
    current_customer.orders << params[:order]
  end

  # GET /customer/make-an-order
  def make_an_order
    current_customer.orders.update_all(:state => 2)
  end

end
