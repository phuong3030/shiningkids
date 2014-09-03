class Admin::OrdersController < ApplicationController

  # GET /view-orders 
  def view_orders
    page = params[:page] || 1

    @orders = Order.page(page).per(5)
  end

end
