class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :video, VideoTopUploader
  
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  attachment :image
end
