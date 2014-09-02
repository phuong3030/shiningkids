class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :product

      t.date :date
      t.integer :state
      t.integer :quantity

      t.timestamps
    end
  end
end
