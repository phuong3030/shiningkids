class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category

      t.string :name
      t.string :name_vi
      t.float :price
      t.float :price_vi
      t.string :stock_unit
      t.float :saleoff
      t.float :saleoff_vi
      t.string :size
      t.string :color
      t.text :description
      t.text :description_vi

      t.timestamps
    end
  end
end
