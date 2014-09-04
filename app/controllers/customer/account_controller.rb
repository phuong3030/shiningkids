class Customer::AccountController < ApplicationController
  before_filter :authenticate_customer!

  # GET / or /my-account
  def my_account
    @orders = current_customer.orders.includes(:product).in_order || []
  end
  
  # GET /edit-account-information
  def edit_account_information
  end

  # PATCH /edit-account-information
  def edit_customer
  end
end
