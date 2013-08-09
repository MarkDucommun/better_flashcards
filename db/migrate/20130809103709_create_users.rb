class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email, unique: true, index: true
      t.string :password_hash
      t.timestamps
    end
  end
end
