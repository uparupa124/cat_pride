class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image
         
  
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  
  validates :telephone_number, presence: true
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  validates :full_name, presence: true
  validates :full_name, uniqueness: true
  validates :user_name, presence: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  
  
  def follow(other_user)
    return if self == other_user
    
    relationships.find_or_create_by!(follower: other_user)
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end
  
  def self.looks(searches, words)
    @user = User.where("user_name LIKE ?", "%#{words}%")
  end
  
end
