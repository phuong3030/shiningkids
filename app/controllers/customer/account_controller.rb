class Customer::AccountController < ApplicationController
  before_filter :authenticate_customer!

  # GET / or /my-account
  def my_account
    
  end
end
