class ChangePostsperpageOfUsers < ActiveRecord::Migration
  def chang
    change_column_default(:users, :postsperpage, 0)
  end
end
