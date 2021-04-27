class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      
      t.string :title
      t.string :body
      t.string :image_id
      t.string :video_id
      t.integer :user_id
      t.timestamps
    end
  end
end
