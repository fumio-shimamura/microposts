class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      
      #add start shimamura 20150720
      t.index :email, unique: true
      #add end
    end
  end
end
