class DropCommentTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :comment
  end
end
