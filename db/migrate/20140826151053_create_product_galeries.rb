class CreateProductGaleries < ActiveRecord::Migration
  def change
    create_table :product_galeries do |t|
      t.integer :img_type
      t.attachment :image

      t.timestamps
    end
  end
end
