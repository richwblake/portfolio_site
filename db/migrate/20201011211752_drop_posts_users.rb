class DropPostsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :posts, :users
  end
end
