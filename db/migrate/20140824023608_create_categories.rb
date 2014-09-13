class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :name_vi
      t.string :description
      t.attachment :image
      t.timestamps
    end
  end
end
