class Admin::OrdersController < ApplicationController
  before_filter :authenticate_admin!

  # GET /view-orders 
  def view_orders
    page = params[:page] || 1

    @orders = Order.includes(:product).in_order.page(page).per(5)
  end

end
