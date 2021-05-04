class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :video_id, VideoTopUploader
  
  
  def self.looks(searches, words)
    @post = Post.where("body LIKE ?", "%#{words}%")
  end
  
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  attachment :image
  
  validates :body, presence: true
  validates :image, presence: true, if: -> { video_id.blank? }
  validates :video_id, presence: true, if: -> { image.blank? }
end
