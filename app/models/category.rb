class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }

  has_attached_file :image, :style => { :medium => "300x300" }, 
        :path => ":rails_root/public/images/category_image/:id/:basename.:extension",
        :url => "/images/category_image/:id/:basename.:extension"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_attachment_size :image, :less_than => 3.megabytes

  def name
    if I18n.locale == :en 
      read_attribute :name
    else
      read_attribute('name_' + I18n.locale.to_s)
    end
  end

end
