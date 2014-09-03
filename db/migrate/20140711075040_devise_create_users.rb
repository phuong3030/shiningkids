class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      # Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false

      # Rememberable

      t.datetime :remember_created_at
      t.string :type
      t.string :firstname
      t.string :lastname

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
