class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :string
    add_column :users, :place, :string
    add_column :users, :website, :string
  end
end
