class ChangePostsperpageOfUsers2 < ActiveRecord::Migration
  def change
    change_column_default(:users, :postsperpage, 0)
  end
end
