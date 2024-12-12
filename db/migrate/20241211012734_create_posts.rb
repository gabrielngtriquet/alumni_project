class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content
      t.integer :comments_count

      t.timestamps
    end
  end
end