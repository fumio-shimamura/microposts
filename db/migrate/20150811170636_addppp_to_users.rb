class AddpppToUsers < ActiveRecord::Migration
  def change
    add_column :users, :postsperpage, :integer
  end
end
