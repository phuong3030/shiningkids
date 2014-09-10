class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.belongs_to :product

      t.integer :img_type
      t.attachment :image
      t.attachment :thumb

      t.timestamps
    end
  end
end
