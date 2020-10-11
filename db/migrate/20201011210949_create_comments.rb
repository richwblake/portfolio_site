class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      create_join_table :users, :posts

      t.timestamps
    end
  end
end
