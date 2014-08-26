class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category

      t.string :name
      t.float :price
      t.float :saleoff
      t.string :size
      t.string :color
      t.string :description

      t.timestamps
    end
  end
end
