class Tweet < ApplicationRecord
  
  belongs_to :user
  attachment :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  
  def liked_by?(user)
      likes.where(user_id: user.id).exists?
  end
end
