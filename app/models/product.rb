class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :order
  has_many :product_images, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }
end
