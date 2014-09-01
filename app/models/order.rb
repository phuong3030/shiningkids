class Order < ActiveRecord::Base
  belongs_to :user
  has_one :product

  scope :cart, -> { where(:state, 1) }
end
