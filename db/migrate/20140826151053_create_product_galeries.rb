class CreateProductImage < ActiveRecord::Migration
  def change
    create_table :product_image do |t|
      t.integer :img_type
      t.attachment :image

      t.timestamps
    end
  end
end
