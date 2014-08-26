class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :order
  has_many :product_galery
end
