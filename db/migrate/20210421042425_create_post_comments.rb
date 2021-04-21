class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.string :comment_image_id
      t.string :comment
      t.integer :post_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
