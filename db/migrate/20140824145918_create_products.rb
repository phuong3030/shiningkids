class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category

      t.string :name
      t.string :name_vi
      t.float :price
      t.string :stock_unit
      t.float :saleoff
      t.string :size
      t.string :color
      t.string :description

      t.timestamps
    end
  end
end
