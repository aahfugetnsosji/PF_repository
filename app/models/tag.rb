class Tag < ApplicationRecord
  # モデル間のアソシエーション
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  # ユーザ側：タグは投稿を複数持つ。post_tagsを通して参照可能
  has_many :posts, through: :post_tags
  
  # 管理者側：タグ名が重複していないか確認
  validates :name, uniqueness: true
end
