class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  # followed_idを参照
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # follower_idを参照
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # reverse_of_relationships(中間テーブル)を通してfollowerを参照→followers、一覧ページ作成のため
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # relationships(中間テーブル)を通してfollowedを参照→followings、一覧ページ作成のため
  has_many :followings, through: :relationships, source: :followed
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :industry

  validates :name, presence:true


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  def get_dm_users
    room_ids = self.rooms.ids #ユーザーのルームの一覧取得
    user_ids = RoomUser.where(room_id: room_ids).where.not(user_id: self.id).pluck('user_id') #取得したユーザーの中で自分以外のIDを取得
    User.where(id: user_ids) #上でIDのみ取得しているため、ユーザー情報を全て返す　eachで使用できる
  end

  def get_room_id(users)
    (self.rooms.ids & users.rooms.ids).first #[1,2] & [2] => [1] #ログインユーザーのルームIDと他のユーザーが持つルームIDが同じもの
  end
end
