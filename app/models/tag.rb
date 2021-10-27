class Tag < ApplicationRecord
  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  # post_tagsを通して参照できる
  has_many :posts,through: :post_tags
  # validates :name, uniqueness: true, presence: true

end
