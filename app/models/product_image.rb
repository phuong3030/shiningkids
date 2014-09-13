class ProductImage < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image, :style => { :medium => "300x300" }, 
        :path => ":rails_root/public/images/product_image/:img_type/:id/:basename.:extension",
        :url => "/images/product_image/:img_type/:id/:basename.:extension"

  has_attached_file :thumb, 
        :path => ":rails_root/public/images/product_image/:img_type/thumb/:id/:basename.:extension",
        :url => "/images/product_image/:img_type/thumb/:id/:basename.:extension"

  validates_attachment_content_type :image, :thumb, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_attachment_size :image, :thumb, :less_than => 2.megabytes
end
