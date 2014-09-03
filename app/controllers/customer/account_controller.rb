class Customer::AccountController < ApplicationController
  before_filter :authenticate_customer!

  # GET / or /my-account
  def my_account
    
  end
  
  # GET /edit-account-information
  def edit_account
  end

  # PATCH /edit-account-information
  def edit_customer
  end
end
