class Tag < ApplicationRecord
  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  # post_tagsを通して参照できる
  has_many :posts,through: :post_tags

  validates :name, uniqueness: true, presence: true
  
  # def self.sort(selection)
  #   case selection
  #   when 'ABC'
  #     return all.order(name: :DESC)
  #   when 'ZYX'
  #     return all.order(name: :ASC)
  #   when 'many'
  #     return find(PostTag.group(:tag_id).order('count(tag_id) desc').pluck(:tag_id))
  #   when 'few'    
  #     return find(PostTag.group(:tag_id).order('count(tag_id) asc').pluck(:tag_id))
  #   end
  # end
  
end
