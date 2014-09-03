class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  scope :cart, -> { where(:state => 1) }
  scope :in_order, -> { where(:state => 2) }
end
