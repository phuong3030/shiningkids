class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  scope :cart, lambda { where(:state => 1) }
  scope :in_order, lambda { where(:state => 2) }
end
