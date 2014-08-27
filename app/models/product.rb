class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :order
  has_many :product_galery

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }
end
