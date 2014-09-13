class Product < ActiveRecord::Base
  belongs_to :category
  has_one :order
  has_many :product_images, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }

  def name
    if I18n.locale == :en 
      read_attribute :name
    else
      read_attribute('name_' + I18n.locale.to_s)
    end
  end

  def description
    if I18n.locale == :en 
      read_attribute :description
    else
      read_attribute('name_' + I18n.locale.to_s)
    end
  end
end
